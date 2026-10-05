import copy
import importlib.util
import json
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[2]
spec = importlib.util.spec_from_file_location('integrity', ROOT / 'scripts/check-reference-integrity.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)


class ConvergenceTests(unittest.TestCase):
    def setUp(self):
        self.snapshot = json.loads((ROOT / 'docs/governance/EDITION-SNAPSHOT.json').read_text())
        self.config = json.loads((ROOT / 'shared/templates/editions.json').read_text())
        self.links = {e['path']: e['commit'] for e in self.snapshot['editions']}

    def test_preserved_pins_pass(self):
        self.assertEqual([], module.validate(self.snapshot, self.config, self.links))

    def test_reference_advance_rejected(self):
        self.links['versions/bmad'] = 'a' * 40
        self.assertTrue(any('Frozen reference advanced' in e for e in module.validate(self.snapshot, self.config, self.links)))

    def test_canonical_advance_permitted(self):
        self.links['versions/claude'] = 'b' * 40
        self.assertEqual([], module.validate(self.snapshot, self.config, self.links))

    def test_unknown_gitlink_rejected(self):
        self.links['versions/new-edition'] = 'c' * 40
        self.assertTrue(module.validate(self.snapshot, self.config, self.links))

    def test_reenabled_template_sync_rejected(self):
        self.config['editions']['claude']['governance_sync'] = True
        self.assertTrue(module.validate(self.snapshot, self.config, self.links))

    def test_eighth_reference_cannot_disappear(self):
        del self.config['editions']['antigravity']
        self.assertTrue(module.validate(self.snapshot, self.config, self.links))

    def test_workflow_cannot_interpolate_arbitrary_edition(self):
        text = (ROOT / '.github/workflows/auto-sync-submodules.yml').read_text()
        self.assertIn("github.event.client_payload.edition == 'claude'", text)
        self.assertIn("github.event.inputs.edition == 'claude'", text)
        self.assertIn('submodule update --init -- versions/claude', text)
        run_section = text.split('        run: |', 1)[1]
        self.assertNotIn('${{', run_section)
        self.assertNotIn('--remote', run_section)

    def test_mutating_parallel_jobs_disabled(self):
        for name in ('sync-governance-files.yml', 'notify-editions-on-shared-update.yml'):
            text = (ROOT / '.github/workflows' / name).read_text()
            self.assertIn('    if: ${{ false }}', text)


if __name__ == '__main__':
    unittest.main()
