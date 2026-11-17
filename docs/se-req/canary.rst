Canary
======

The canary is a small, permanent trace chain through all robarm repos. It proves that the tools
work together on real files, through the real registries and the real CI (plan task 5.3, P5-1).
It is not a design of the robot arm and it need not work. Everything in it belongs to the system
configuration ``canary``, so reports, BOM totals and coverage numbers can leave it out (P5-16).

.. sys-sth:: Toolchain maintainer
   :id: SYS-STH-0001
   :status: valid
   :configs: SYS-CFG-0001

   The person who keeps the XDMOD tools and the robarm repos working together.

.. sys-need:: A trace chain that tests the tools
   :id: SYS-NEED-0001
   :status: valid
   :category: need
   :raised_by: SYS-STH-0001
   :configs: SYS-CFG-0001

   The toolchain maintainer needs one small trace chain that runs through every repo, from a
   stakeholder need down to a test result, so that a broken tool shows up at once.

.. sys-req:: Canary response time
   :id: SYS-REQ-0001
   :status: valid
   :refines: SYS-NEED-0001
   :category: performance
   :ears: event
   :quantity: latency
   :unit: ms
   :max: 50
   :verification_method: test
   :verification_scope: logical
   :configs: SYS-CFG-0001

   When the canary input changes, the canary shall update its output within 50 ms.
