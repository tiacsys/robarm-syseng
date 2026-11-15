# robarm-syseng: rules for agents

Read the workspace `CLAUDE.md` (copied from `xdmod/launch/CLAUDE.md`) first. This file adds the
rules of this repo. Run every command from the workspace root.

## What this repo is

The left side of the V: stakeholders, needs, system requirements (rst, sphinx-needs) and the
SysML v2 system model (SYSMOD steps, variants with PLEML). Every other robarm repo links to the
needs defined here, so a change here can make links elsewhere suspect.

## Layout and rules

- `docs/se-req/`: stakeholders (`SYS-STH`), needs (`SYS-NEED`, the problem statement has
  `category: problem`, objectives `category: objective`), system requirements (`SYS-REQ`, EARS
  sentence plus value fields `quantity`, `unit`, `min`/`max`/`nominal`, `ears`, `where`,
  `verification_scope`).
- `docs/se-arch/`: architecture text; the model needs come from `generated/model-needs.json`.
- `model/*.sysml`: one file per SYSMOD step group. A model element becomes a need only when its
  short name is an ID (`SYS-EL`, `SYS-IF`, `SYS-UC`, `SYS-CFG`, `SYS-FEAT`), and only once it has
  a trace link (D129). The definition holds the ID, not the usage (D128).
- Every `SYS-EL` needs a layer (`@Trace { layer = ...; }` on the element or its package).
- Requirements are referenced in SysML only through the generated stubs in
  `model/generated/NeedStubs.sysml` (`sys_req_nnnn`). Never edit that file.
- Views: SysML `view` in `model/views.sysml` with `@XdView`; the files in `views/` are generated.

## Generate, commit, check

After a change, in this order:

1. `curatrix docs robarm-syseng` (the stubs are made from the built needs);
2. `curatrix gen all robarm-syseng` (stubs, `generated/model.json`, `generated/model-needs.json`);
3. `curatrix views build robarm-syseng` if the model or a view changed;
4. `curatrix check robarm-syseng --stage local`.

Commit the generated files together with the change that caused them.

## Pitfalls

- The model check needs the SYSMOD and PLEML libraries in `libs/` (west projects) and Java
  (`.venv/opt/jdk`). Without them CK-E1 and CK-D2 fail with "file not found".
- New needs and model elements get placeholder IDs (`SYS-REQ-NEW-a`) and then
  `curatrix ids fix robarm-syseng`. Never type a number yourself.
- A need that is no longer wanted is set to `status: retired`, not deleted (D64e, D130).
- The Pilot's exit code is not reliable; trust the check's result, not jshell's.
