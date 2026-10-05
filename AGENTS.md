# TVM parent repository — provenance and convergence

Reviewed: 2026-10-05. Current user direction: one canonical application in [true-valence-mapper-claude/v1](https://github.com/rhart696/true-valence-mapper-claude/tree/main/v1), with evidence-governed product–service development. Read [CURRENT-STATE](docs/CURRENT-STATE.md), [CONVERGENCE](docs/CONVERGENCE.md) and canonical [START-HERE](https://github.com/rhart696/true-valence-mapper-claude/blob/main/docs/START-HERE.md).

This parent retains eight edition references and shared provenance. Do not write app code in this repository or edit submodule contents. Work in standalone canonical app repo for product functionality. Noncanonical editions are reference-frozen by project policy, not remote GitHub archive settings.

Do not update prototype gitlinks to their latest remote heads or use git submodule update --remote indiscriminately. Preserve the snapshot SHA inventory. Only the canonical claude reference may advance through the canonical-only sync; product truth remains in its repository. Do not overwrite its AGENTS.md from parent templates. Legacy templates/workflows are preserved but their overwrite/parallel-adoption jobs are disabled.

Before cross-repo changes, read relevant canonical requirements/decisions/evidence and preserve provenance. A new change record should cite affected IDs, risks, tests and exact files. Never push directly to main, delete/archive repositories, rewrite history or merge/deploy without authorization. Prepare branches/PRs with validation; do not ask again for already-authorized Phase 0 documentation/tooling work.

Read-only checks: python3 scripts/check-reference-integrity.py; python3 -m unittest discover -s scripts/tests -v. Source pin inventory is docs/governance/EDITION-SNAPSHOT.json. Sensitive data and production secrets stay out of git. Current product/service direction overrides historical independent-edition roadmaps and unconditional push-to-main instructions preserved under docs/archive.
