// SYSMOD step 10c: the 150 % product architecture with its variation points (VAMOS, D102).
// SPDX-License-Identifier: Apache-2.0
// Variants are bound to features of features.sysml through PLEML feature bindings.
// Skeleton only: the content comes in Phase 6.
package RobArmProduct {
    doc /* The product architecture of all members of the product line, with the allocations. */
    private import XdTrace::*;
    private import NeedStubs::*;
    private import SI::*;
    @Trace { layer = "product"; }

    // The canary (plan task 5.3, configuration SYS-CFG-0001): a small trace chain that tests the
    // tools. It is not part of the robot arm; tools and views can leave out this one package.
    // Written "public package": curatrix (model.top_packages) takes every line that starts with
    // "package" for a top-level package and then fails to export it.
    public package Canary {
        part def <'SYS-EL-0001'> CanaryUnit {
            doc /* The one product element of the canary: a board, a part and a bit of firmware.
                 * It realizes no logical element on purpose (canary C0 skips the logical layer).
                 * Real product elements realize a logical element (D85); do not copy this. */
        }
        // The space budget of the canary board (task 5.28, XD-ADR-0134): its mechanical interface,
        // which EE and ME both depend on. A budget is a box, a hole list and connector positions,
        // in the board frame: origin at the lower-left corner of the board outline seen from the
        // top, x right, y up, z = 0 on the top face. The box takes heightAbove above the top face
        // and heightBelow below it (the board's own thickness included). Holes are hole<n>X/Y with
        // one holeDiameter and a mounting zone of mountZoneDiameter around each; a connector
        // position is the pin-1 position <ref>X/Y. The canary board
        // conforms to it (EE model), the board seat of the canary assembly too (ME model, whose
        // values CK-F3 holds against FreeCAD); KiCad gets outline and holes by the StepUp push.
        // The values are defaults, not bindings (=), so a domain port def can restate them (ME copies
        // the ones FreeCAD needs). Like CanaryUnit it sits in the canary package; budgets of the arm
        // go to context.sysml.
        port def <'SYS-IF-0001'> CanaryBoardSpace {
            doc /* The space the canary board may take: box, mounting holes with their zones, connector J1. */
            attribute width default 30 [mm];
            attribute depth default 20 [mm];
            attribute heightAbove default 10 [mm];
            attribute heightBelow default 3 [mm];
            attribute holeDiameter default 3.2 [mm];
            attribute hole1X default 4 [mm];
            attribute hole1Y default 4 [mm];
            attribute hole2X default 24 [mm];
            attribute hole2Y default 16 [mm];
            attribute mountZoneDiameter default 8 [mm] {
                doc /* The mounting zone around each mounting hole: a circle of this diameter around
                     * the hole, on both sides of the board, through the whole box height (owner
                     * decision 2026-11-18, xdmod#69). EE keeps parts and pads out of a zone; ME may put
                     * supports below the board and fastener heads above it there. */
            }
            attribute j1X default 7 [mm];
            attribute j1Y default 12 [mm];
        }
        part def CanaryContext {
            part canaryUnit : CanaryUnit;
            satisfy sys_req_0001 by canaryUnit;
        }
        // The canary configuration (configs.sysml) configures the canary unit. It sits here
        // because the Pilot reads the model files in name order.
        dependency from RobArmConfigs::canary to CanaryUnit;
    }
}
