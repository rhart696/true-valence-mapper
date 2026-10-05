# Canonical product convergence

Owner: Richard Hart / ProActive ReSolutions · Reviewed: 2026-10-05.
Canonical decisions: DEC-0001 (one app), DEC-0002 (evidence-governed product/service), DEC-0006 (traceability). Canonical requirements: REQ-0001/2/12. These IDs live in the standalone claude repo, not fabricated parent duplicates.

## Policy and snapshot

Keep claude/v1 as canonical; preserve all eight historical edition commit references in docs/governance/EDITION-SNAPSHOT.json. Other editions are reference-frozen by project policy. GitHub repositories remain writable; no irreversible remote archiving, annotated tags or deletion performed. The SHA manifest is a reproducible baseline, not proof that every sibling implementation was audited.

Prototype gitlinks must remain at their recorded snapshot. Canonical claude gitlink can advance through its normal approved main-release synchronization. This parent does not change runtime data or deploy the app.

## Automation changes

- auto-sync-submodules handles only claude, with a fixed repository path and no untrusted edition interpolation. Other dispatches/manual requests are skipped.
- sync-governance-files retains its rollback history but its overwrite job is disabled; it must not replace canonical AGENTS.md or mutate reference repos.
- notify-editions-on-shared-update parallel adoption job is disabled; old branch contents remain as reference.
- weekly health check now verifies frozen reference integrity and the canonical-only configuration rather than requiring all editions to stay current.
- PR convergence check runs read-only integrity and regression checks. No repository creation or cross-repo pushes occur in these checks.

## Review/merge order

Both PRs are reviewable proposals. Merge the parent convergence change first, then the canonical governance foundation; this prevents future legacy template synchronization overwriting the new entry point. No PR is merged automatically. App main may auto-deploy per its README, so coordinate human merge/release review. Canonical AGENTS.local also preserves current authority if an older template appears during transition.

The original parent snapshot is at 82646a5f6a40a76f9a579f98f2960ebae4372c56. Existing submodule references remain unchanged in this proposal. Check permissions and branch protections with the owner if remote integration fails; do not force-push or remove review checks.

## Operating model

Canonical sources/claims/decisions/requirements are indexed in the canonical docs/governance/registry.json. Parent records link there; avoid duplicating rationale. Update snapshot only through explicit research-provenance decision, not weekly automation. A future research branch can explore a question without becoming another canonical product.
