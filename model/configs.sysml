// SYSMOD step 10d: configurations (SYS-CFG), one product model each (PLEML, D102, D107).
// SPDX-License-Identifier: Apache-2.0
// Skeleton only: the content comes in Phase 6. The canary configuration (P5-16) owns the
// canary trace chain (plan task 5.3); it is not a product of the robot arm.
package RobArmConfigs {
    doc /* The configurations of the robot arm (prototype, product) and their product models. */
    private import PLEML::*;

    part def <'SYS-CFG-0001'> canary {
        doc /* The canary: a small, permanent trace chain through all repos that tests the tools.
             * Reports, BOM totals and coverage numbers leave it out. The elements it configures
             * are linked in product.sysml: the Pilot reads the model files in name order, so this
             * file cannot refer to elements of product.sysml. */
    }
}
