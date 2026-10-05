# True Valence Mapper — provenance and canonical product

The canonical application is [true-valence-mapper-claude/v1](https://github.com/rhart696/true-valence-mapper-claude/tree/main/v1). Its [START-HERE](https://github.com/rhart696/true-valence-mapper-claude/blob/main/docs/START-HERE.md), current state, product/service specifications, decisions and evidence govern development.

This parent preserves eight reference lineages, immutable snapshot metadata, brand assets and historical governance. It is not a set of equally active product editions. See [convergence and merge order](docs/CONVERGENCE.md), [current state](docs/CURRENT-STATE.md) and [snapshot](docs/governance/EDITION-SNAPSHOT.json).

No repositories were deleted or placed into GitHub read-only archive mode. Existing prototype gitlinks remain unchanged. Noncanonical advancement and template overwrites are retired by the companion workflow changes; canonical reference advancement remains supported. New prototype research requires an explicit canonical decision.

Checks: `python3 scripts/check-reference-integrity.py` and `python3 -m unittest discover -s scripts/tests -v`. Work on branches; no direct main push. Source and intervention evidence must remain traceable. Executive pilot readiness is determined by canonical release gates, not parent health status.

Original parent README and governance documents are preserved in docs/archive/governance-2026-10-05. `.gitmodules` remains intact for provenance; avoid recursive --remote updates that advance frozen refs.
