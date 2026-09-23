# Claim 4 — workflow runner execution fence

Status: proven.

Implementation repository: `animus-workflow-runner-default`, branch `codex/execution-fence-v1`, commit `4339630`.

The runner validates the persisted workflow generation, subject generation, repository reservation, queue entry, lease generation, and lease owner before resume. A higher lease generation is accepted only as explicit recovery. Before any resumed phase runs, that recovered fence replaces the old fence in the durable workflow journal.

Proof run on 2026-09-23:

- Full `cargo test`: 410 passed, 0 failed, 4 pre-existing ignored.
- `resume_fence_rejects_stale_or_same_generation_foreign_owner` proves lower generations and same-generation foreign owners fail.
- `recovered_fence_is_persisted_before_resume_and_supersedes_old_owner` saves a workflow, advances recovery ownership, reloads it from disk, and proves the former owner is still rejected.
- Required-publication tests prove missing or incomplete scheduler authority fails closed.
- Installed binary SHA-256: `cc0fcc1f7543bb4d0900e004e6173e4a2b1efbd87596ba60379b294a5b8e8fa4`.

The production daemon accepted this runner during ordinary startup without `--skip-preflight`.
