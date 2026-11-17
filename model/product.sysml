// SYSMOD step 10c: the 150 % product architecture with its variation points (VAMOS, D102).
// SPDX-License-Identifier: Apache-2.0
// Variants are bound to features of features.sysml through PLEML feature bindings.
// Skeleton only: the content comes in Phase 6. CanaryUnit belongs to the canary configuration
// (SYS-CFG-0001, plan task 5.3); it is not part of the robot arm.
package RobArmProduct {
    doc /* The product architecture of all members of the product line, with the allocations. */
    private import XdTrace::*;
    private import NeedStubs::*;
    @Trace { layer = "product"; }

    part def <'SYS-EL-0001'> CanaryUnit {
        doc /* The one product element of the canary: a board, a part and a bit of firmware. */
    }
    part def CanaryContext {
        part canaryUnit : CanaryUnit;
        satisfy sys_req_0001 by canaryUnit;
    }
    // The canary configuration (configs.sysml) configures the canary unit.
    dependency from RobArmConfigs::canary to CanaryUnit;
}
