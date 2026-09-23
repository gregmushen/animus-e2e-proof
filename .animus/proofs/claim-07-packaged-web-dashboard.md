# Claim 7 — packaged web dashboard

Status: proven.

Web UI branch: `codex/graphql-compat-main`.

- Commit `e57dcfe` adds HTTP and WebSocket GraphQL forwarding to the Rust packaged server.
- Commit `25a6655` adds live GraphQL compatibility checks and fixes the production asset-budget checker to inspect `dist/`.
- `npm run build` passes, including JS/CSS gzip budgets.
- Wrapper `cargo test`: 7 passed, 0 failed.
- The release wrapper was built, installed as `animus-web-ui`, and launched through `animus web serve`; this was not a Vite server.
- POST `/graphql` through port 8082 ran all 11 checked-in query operations with HTTP 200 and no GraphQL errors. This directly disproves the former packaged-server HTTP 405 failure.

Packaged route smoke results:

- Dashboard: rendered healthy daemon, three tasks, queue totals, and 12 plugins.
- Tasks: rendered three real task records.
- Requirements: rendered a valid empty state.
- Workflows: rendered four workflow records including the detached completed run.
- Queue: rendered a valid empty queue after terminal cleanup.
- Agents: rendered its live no-active-agent state.
- Events: rendered live activity state.
- History: rendered four workflow history entries.
- Daemon: rendered running `0.7.0-rc.52`, project root, uptime, and 12 healthy plugins.

Every route returned HTTP 200 with the embedded React root. The dashboard and daemon components render GraphQL errors through `PageError`; `daemon-page.test.tsx` explicitly covers a connection-refused query state, so backend failure is not converted to misleading zero values.
