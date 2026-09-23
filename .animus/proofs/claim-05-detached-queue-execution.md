# Claim 5 — detached queue execution and recovery

Status: proven.

A real task was created and submitted through the installed queue plugin and live daemon:

- subject: `task:TASK-003`
- queue entry: `b263bd27-7103-4718-b2f2-01453157e1e0`
- workflow: `a519084c-05ee-41c6-bc35-a73ee602b3aa`
- workflow definition: `proof-workflow`
- observed queue states: pending/assigned, followed by removal after terminal completion
- terminal workflow state: `completed`
- artifact: `animus-detached-proof.txt`
- artifact content: `Animus detached queue proof`
- artifact commit: `03ce570`

The first attempt also supplied useful negative proof: the runner rejected a double-qualified subject fence rather than executing under mismatched authority. Queue commit `a0ab149` fixed canonicalization, and the repeated detached dispatch then completed.

Restart recovery is covered by the queue test `v2_recovery_requires_expiry_and_fences_old_owner`: it leases work, persists an expired lease, drops the backend instance, constructs a new backend from disk, recovers under a new owner and incremented generation, then proves the prior owner cannot renew. This establishes durable controlled interruption recovery without allowing duplicate ownership.
