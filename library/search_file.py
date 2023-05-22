#!/usr/bin/python

# Copyright: (c) 2022, Fabian Köhler <fabian.koehler@protonmail.ch>
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
from __future__ import absolute_import, division, print_function

__metaclass__ = type

DOCUMENTATION = r"""
"""

EXAMPLES = r"""
"""

RETURN = r"""
"""

from ansible.module_utils.basic import AnsibleModule
import os
import glob


def main():
    module = AnsibleModule(
        argument_spec=dict(
            name=dict(type="str", required=True),
            paths=dict(type="list", required=True, elements="path"),
            executable=dict(type="bool", default=False),
            glob=dict(type="bool", default=False),
        )
    )

    executable = module.params.get("name")
    for path in module.params.get("paths"):
        if module.params.get("glob"):
            candidates = [os.path.join(p, executable) for p in glob.glob(path)]
        else:
            candidates = [os.path.join(path, executable)]

        for candidate in candidates:
            if not os.path.exists(candidate):
                continue

            if module.params.get("executable") and (not os.access(candidate, os.X_OK)):
                continue

            module.exit_json(changed=False, found=True, path=candidate)

    module.exit_json(changed=False, found=False, path="")


if __name__ == "__main__":
    main()
