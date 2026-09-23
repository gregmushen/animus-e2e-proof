# Claim 2 proof: synchronous agent workflow

Recorded: 2026-09-23 (America/Los_Angeles)

## Task

- Subject: `task:TASK-002`
- Title: `Complete synchronous workflow proof`
- Requested artifact: `animus-e2e-proof-2.txt`
- Requested exact content: `Animus synchronous workflow completed.`
- Requested commit: `test: complete synchronous workflow proof`

The task was created through `animus subject create --kind task ... --status ready --json`.

## Execution

Command:

```sh
animus --project-root /Users/gregmushen/work/code/animus \
  workflow run proof-workflow --subject-id task:TASK-002 \
  --sync --phase-timeout-secs 240 --json
```

The workflow runner reported:

```json
{
  "via": "plugin_host",
  "workflow_id": "41e9960e-ac06-4e19-bbdd-366507b8b588",
  "workflow_ref": "proof-workflow",
  "workflow_status": "completed",
  "results": [{
    "phase_id": "implementation",
    "status": "completed",
    "duration_secs": 13,
    "selected_tool": "claude",
    "selected_model": "claude-sonnet-4-6",
    "effective_capabilities": {
      "mutates_state": true,
      "requires_commit": true,
      "writes_files": true
    },
    "verdict": "advance"
  }]
}
```

`animus workflow get --id 41e9960e-ac06-4e19-bbdd-366507b8b588 --json` independently reported `status: completed`, `machine_state: completed`, phase `implementation: success`, and an `advance` decision at confidence `0.99`.

## Artifact and commit

The agent created `animus-e2e-proof-2.txt` with the exact requested content. Git recorded:

```text
commit=8a6a4e3775ded913c1b08d557c059462366542bc
subject=test: complete synchronous workflow proof
animus-e2e-proof-2.txt | 1 +
```

The workflow request/session record includes the subject ID, title, description, project root, execution cwd, agent ID, provider, model, and rendered phase directive under:

```text
~/.animus/animus-988d66c995d9/runs/41e9960e-ac06-4e19-bbdd-366507b8b588/
```

## Separate defect discovered

An earlier Codex-provider attempt failed before agent execution because the provider launched `codex exec --full-auto`, while the installed Codex CLI rejected `--full-auto`. That failure is not used as proof for this claim; it is retained as compatibility evidence for the provider/release work.
