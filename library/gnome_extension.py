#!/usr/bin/python

from __future__ import absolute_import, division, print_function
from ansible.module_utils.basic import AnsibleModule

_metaclass__ = type

DOCUMENTATION = ""
EXAMPLES = ""
RETURN = ""


def run_module():
    module_args = dict(
        name=dict(type="str", required=True),
        state=dict(
            type=str,
            default="present",
            choices=["present", "enabled", "absent", "disabled"],
        ),
    )

    result = dict(
        changed=False,
    )

    module = AnsibleModule(
        argument_spec=module_args,
        supports_check_mode=True,
    )

    enabled_extensions = [
        line.strip()
        for line in module.run_command("gnome-extensions list --enabled")[
            1
        ].splitlines()
        if line
    ]

    available_extensions = [
        line.strip()
        for line in module.run_command("gnome-extensions list")[1].splitlines()
        if line
    ]

    extension = module.params.get("name")

    if module.params.get("state") in ["absent", "disabled"]:
        if extension not in available_extensions:
            module.exit_json(**result)

        if extension not in enabled_extensions:
            module.exit_json(**result)

        result["changed"] = True
        if module.check_mode:
            module.exit_json(**result)

        rc, _, err = module.run_command("gnome-extensions disable {}".format(extension))
        if rc != 0:
            module.fail_json(
                msg='Failed to disable extension "{}": {}'.format(extension, err)
            )
    elif module.params.get("state") in ["present", "enabled"]:
        if extension in enabled_extensions:
            module.exit_json(**result)

        result["changed"] = True
        if module.check_mode:
            module.exit_json(**result)

        rc, _, err = module.run_command("gnome-extensions enable {}".format(extension))
        if rc != 0:
            module.fail_json(
                msg='Failed to disable extension "{}": {}'.format(extension, err)
            )

    module.exit_json(**result)


def main():
    run_module()


if __name__ == "__main__":
    main()
