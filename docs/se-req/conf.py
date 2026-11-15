# Sphinx configuration of the document "Stakeholder and System Requirements Specification" (se-req).
# The shared XDMOD setup (xdmod/sphinx/xdmod_conf.py) wraps zdocs' configure() and loads the
# XDMOD Sphinx extension and sphinx-test-reports.
import os
import sys
from pathlib import Path

sys.path.insert(0, str(Path(os.environ["ZDOCS_WEST_TOPDIR"]) / "xdmod" / "sphinx"))
from xdmod_conf import configure, repo_root  # noqa: E402

REPO = repo_root(__file__)
configure(globals(), __file__, "Stakeholder and System Requirements Specification",
          generated=[(REPO, "generated/*.json")])
