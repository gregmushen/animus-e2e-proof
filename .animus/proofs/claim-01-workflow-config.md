# Claim 1 proof: workflow configuration loads successfully

Recorded: 2026-09-23 (America/Los_Angeles)
CLI: `/Users/gregmushen/work/code/animus-cli/target/release/animus` (`0.7.0-rc.52`)
Project: `/Users/gregmushen/work/code/animus`

## Validation

Command:

```sh
animus --project-root /Users/gregmushen/work/code/animus workflow config validate --json
```

Evidence:

```json
{"valid":true,"summary":{"agents":5,"errors":0,"phases":11,"warnings":0,"workflows":25},"errors":[],"warnings":[],"workflow_config_hash":"7eca9a0b2a0c071c81cba684fe2f59c047b2ba2ca4104ec324616692b498df93"}
```

## Compilation

Command:

```sh
animus --project-root /Users/gregmushen/work/code/animus workflow config compile --json
```

Evidence:

```json
{"compiled":true,"agent_profiles":5,"phase_definitions":11,"workflows":["standard-workflow"],"warnings":[],"hash":"7eca9a0b2a0c071c81cba684fe2f59c047b2ba2ca4104ec324616692b498df93"}
```

The full command output listed 25 workflows. The excerpt retains the claim-relevant workflow.

## Definition

`animus workflow definitions list --json` returned:

```json
{"id":"standard-workflow","name":"Task Queue Delivery Workflow","phases":["subject-activate","implementation","review","push-branch","create-pr"]}
```

## Daemon load

The daemon was restarted after compilation. Its first line was:

```text
daemon-config ts=2026-09-23T21:15:28.101658+00:00 source=Plugin workflows=25 environment_map={}
```

`animus daemon status --json` then reported PID 31540, `running:true`, and version `0.7.0-rc.52`. Filtering the new daemon log for `workflow|fallback|warn|error|daemon-config` returned no matches. The daemon was deliberately started with `--skip-preflight`; that exception belongs to Claim 3 and is not evidence for queue compatibility.
