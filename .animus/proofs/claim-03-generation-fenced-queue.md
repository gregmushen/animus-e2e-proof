# Claim 3 — generation-fenced queue

Status: proven.

Implementation repositories:

- `animus-queue-default` branch `codex/generation-fenced-queue-v2`
- commits `6979a4b`, `a0ab149`, and `118af61`
- package version `0.4.0`

The plugin advertises and implements `queue/v2/enqueue`, `queue/v2/lease`, `queue/v2/renew`, `queue/v2/recover`, `queue/v2/complete`, and `queue/v2/release_pending`, with `generation_fenced_leases_v1: true`. State persists idempotency keys, monotonic subject and lease generations, workflow IDs, lease owners and expiry, repository reservations, and completion tombstones.

Proof run on 2026-09-23:

- `cargo test` in `animus-queue-default`: 35 passed, 0 failed.
- Durable enqueue replay returns the original receipt.
- Renew rejects an old generation.
- Recovery refuses a live lease, accepts an expired lease, increments its generation, and fences the old owner.
- The recovery test destroys the first backend instance and reopens the persisted store before recovery, proving restart durability.
- Completion and release are idempotent and stale-fence aware.
- Qualified task IDs are canonicalized once; `task:TASK-003` no longer becomes `animus.task:task:TASK-003`.
- Installed binary SHA-256: `62af36c7330294358994507935729fef8c91cb2a4ab7c1d2668beb5989fade90`.

The production daemon accepted this plugin during ordinary startup without `--skip-preflight`.
