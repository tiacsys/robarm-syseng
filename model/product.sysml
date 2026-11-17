// SYSMOD step 10c: the 150 % product architecture with its variation points (VAMOS, D102).
// SPDX-License-Identifier: Apache-2.0
// Variants are bound to features of features.sysml through PLEML feature bindings.
// Skeleton only: the content comes in Phase 6.
package RobArmProduct {
    doc /* The product architecture of all members of the product line, with the allocations. */
    private import XdTrace::*;
    private import NeedStubs::*;
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
        part def CanaryContext {
            part canaryUnit : CanaryUnit;
            satisfy sys_req_0001 by canaryUnit;
        }
        // The canary configuration (configs.sysml) configures the canary unit. It sits here
        // because the Pilot reads the model files in name order.
        dependency from RobArmConfigs::canary to CanaryUnit;
    }
}
