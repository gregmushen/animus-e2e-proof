# Claim 6 — GraphQL compatibility

Status: proven.

The web UI branch `codex/graphql-compat-main` adds `npm run test:graphql-compat` in commit `25a6655`. The runner reads the UI's checked-in `.graphql` operations and submits each named query to a configured endpoint, failing on a non-200 response, GraphQL errors, or null data.

Against `http://127.0.0.1:8082/graphql` on 2026-09-23, all operations passed with HTTP 200 and no GraphQL errors:

- Dashboard
- Daemon
- ReadySubjects
- DispatchRequirements
- DaemonActivity
- Queue
- Subjects
- SubjectDetail (`task:TASK-003`)
- SubjectNext
- Workflows
- WorkflowDetail (`a519084c-05ee-41c6-bc35-a73ee602b3aa`)

The returned dashboard data matched live CLI state: daemon running at `0.7.0-rc.52`, 12 healthy plugins, zero queued entries after completion, three tasks, and completed workflow `a519084c-05ee-41c6-bc35-a73ee602b3aa`.
