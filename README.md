# robarm-syseng

Systems engineering of the robot arm example of [XDMOD](https://github.com/tiacsys/xdmod):
the left side of the V-model. It holds the stakeholder needs, the system requirements and the
SysML v2 system model (SYSMOD method, variants with PLEML).

Status: **skeleton** (Phase 4). The structure, the checks and empty documents are in place; the
content comes in Phase 6.

## Layout

| Path | What |
|---|---|
| `model/` | SysML v2 model, one file per SYSMOD step: `project`, `context`, `usecases`, `functional`, `logical`, `product` (150 % model), `features`, `configs`, `views` |
| `model/generated/` | `NeedStubs.sysml`: read-only stubs of the needs, so the model can reference them (generated) |
| `views/` | `<view>.drawio.svg` diagrams rendered from the model (generated, editable layout) |
| `generated/` | `model.json`, `model-needs.json` (and later `interfaces.json`), generated from the model |
| `docs/se-req/` | Stakeholder and System Requirements Specification |
| `docs/se-arch/` | System Architecture |
| `ids.yaml` | ID ledger for `SYS-*` IDs |
| `checks.yaml` | what `curatrix check robarm-syseng` runs |
| `claude/` | rules and skills for agents working in this repo |

## Use

This repo is a west project of the [robarm-manifest](https://github.com/tiacsys/robarm-manifest)
workspace. Run every command from the workspace root:

```sh
curatrix docs robarm-syseng                  # build the documents (strict)
curatrix gen all robarm-syseng               # regenerate stubs, model JSON and model needs
curatrix check robarm-syseng --stage local   # all checks, as before a push
```

The model check needs the SYSMOD and PLEML libraries under `libs/` (fetched by `west update`).

## Licence

Apache-2.0, see `LICENSE`.
