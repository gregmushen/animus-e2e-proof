# Claim 8 — Git-backed delivery

Status: proven.

Disposable public test repository: `https://github.com/gregmushen/animus-e2e-proof`.

Correlated execution:

- task: `task:TASK-004`
- queue entry: `46be805a-ce36-4801-ad78-814e0347bf47`
- subject generation: 2
- workflow: `a2658c27-47fd-4e32-9d9c-6b7fdbf81049`
- branch: `animus/a2658c27-47fd-4e32-9d9c-6b7fdbf81049`
- implementation commit: `0fe81bdcfd8028c84ad2d5d760e7c5f0f76031e6`
- final reviewed head: `b1d07f1328ff92337e262c00f0a97bcdd2be5eac`
- draft pull request: `https://github.com/gregmushen/animus-e2e-proof/pull/1`

The workflow created the branch, activated the task, ran the implementation agent, and entered review. The reviewer returned `rework` twice because the exact-content assertion was absent. After `test-git-delivery-proof.sh` was added and passed, review returned `advance` with confidence 0.97 and low risk. The workflow then pushed the branch, opened draft PR #1, and reached `completed`.

Validation command `./test-git-delivery-proof.sh` exited successfully and proves `git-delivery-proof.txt` contains exactly `Animus Git delivery proof`.

The disposable draft PR was closed after proof collection; its branch and audit record remain available.
