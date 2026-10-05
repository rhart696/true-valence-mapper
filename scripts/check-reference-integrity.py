#!/usr/bin/env python3
"""Read-only checks for canonical/reference policy and frozen gitlink integrity."""
import json
from pathlib import Path
import re
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]


def validate(snapshot, config, gitlinks):
    errors = []
    entries = snapshot.get('editions', [])
    if snapshot.get('schema_version') != 1 or len(entries) != 8:
        errors.append('Expected schema 1 and eight preserved edition references')
    if config.get('canonical_edition') != 'claude':
        errors.append('Canonical edition must be claude')
    paths, repos = set(), set()
    canonical = []
    for entry in entries:
        path, sha, role, url = (entry.get(k, '') for k in ('path', 'commit', 'role', 'repository_url'))
        if path in paths or not path.startswith('versions/') or '..' in Path(path).parts:
            errors.append(f'Invalid/duplicate reference path: {path}')
        paths.add(path)
        if url in repos or not url.startswith('https://github.com/rhart696/'):
            errors.append(f'Invalid/duplicate reference repository: {url}')
        repos.add(url)
        if not re.fullmatch('[a-f0-9]{40}', sha):
            errors.append(f'Invalid snapshot SHA: {path}')
        if path not in gitlinks:
            errors.append(f'Missing gitlink: {path}')
        elif role == 'reference' and gitlinks[path] != sha:
            errors.append(f'Frozen reference advanced: {path}')
        if role == 'canonical':
            canonical.append(path)
        elif role != 'reference':
            errors.append(f'Invalid role: {path}')
        matches = [v for v in config.get('editions', {}).values() if v.get('repo') == url.rsplit('/', 1)[-1]]
        if len(matches) != 1 or matches[0].get('role') != role or matches[0].get('governance_sync') is not False:
            errors.append(f'Configuration does not preserve role/disable template sync: {path}')
    if canonical != ['versions/claude']:
        errors.append('Only versions/claude may be canonical')
    if paths != set(gitlinks):
        errors.append('Unrecorded gitlink or missing reference in snapshot')
    if len(config.get('editions', {})) != 8:
        errors.append('Edition configuration must contain all eight references')
    return errors


def main():
    try:
        snapshot = json.loads((ROOT / 'docs/governance/EDITION-SNAPSHOT.json').read_text())
        config = json.loads((ROOT / 'shared/templates/editions.json').read_text())
        output = subprocess.check_output(['git', 'ls-files', '--stage', '-z', '--', 'versions/'], cwd=ROOT).decode()
        links = {}
        for entry in output.split('\0'):
            if not entry:
                continue
            metadata, path = entry.split('\t', 1)
            mode, sha, stage = metadata.split()
            if mode == '160000' and stage == '0':
                links[path] = sha
        errors = validate(snapshot, config, links)
        for error in errors:
            print('FAIL:', error, file=sys.stderr)
        if errors:
            return 1
        print('PASS: eight recorded references; seven frozen pins; canonical-only policy')
        return 0
    except (OSError, ValueError, KeyError, TypeError, subprocess.CalledProcessError) as error:
        print('FAIL:', error, file=sys.stderr)
        return 1


if __name__ == '__main__':
    sys.exit(main())
