#!/usr/bin/python

from __future__ import absolute_import, division, print_function
from ansible.module_utils.basic import AnsibleModule

__metaclass__ = type

DOCUMENTATION = ""
EXAMPLES = ""
RETURN = ""


def run_module():
    module_args = dict(
        force=dict(
            type="bool",
            default=False,
            required=False,
        ),
        reset=dict(
            type="bool",
            default=False,
            required=False,
        )
        key=dict(
            type="str",
            required=True,
        ),
        value=dict(type="str", required=False),
    )

    result = dict(
        changed=False,
    )

    module = AnsibleModule(
        argument_spec=module_args,
        supports_check_mode=True,
    )

    def require_notdir(key):
        if key.endswith("/"):
            module.fail_json(msg='Key "{}" is a directory'.format(key))

    def read_value(key):
        require_notdir(key)

        rc, out, err = module.run_command("dconf read {}".format(key))
        if rc != 0:
            module.fail_json(msg='Failed to read key "{}": {}'.format(key, err))
        return out.strip()

    def write_value(key, value):
        require_notdir(key)

        rc, _, err = module.run_command("dconf write {} {}".format(key, value))
        if rc != 0:
            module.fail_json(msg='Failed to write key "{}": {}'.format(key, err))

    key = module.params.get("key")
    if not key.endswith("/"):
        result["value"] = read_value(key)

    if module.params.get("reset"):
        if module.params.get("value"):
            module.fail_json(msg="Do not set a value for key when resetting it")

        if module.check_mode:
            module.exit_json(**result)

        if key.endswith("/"):
            if not module.params.get("force"):
                module.fail_json(
                    msg='Resetting directories requires setting "force=true"'
                )
        if module.params.get("force"):
            cmd = "dconf reset -f {}".format(key)
        else:
            cmd = "dconf reset {}".format(key)

        rc, _, err = module.run_command(cmd)
        if rc != 0:
            module.fail_json(msg='Failed to reset "{key}"')

        result["new_value"] = read_value(key)
        result["changed"] = result["value"] != result["new_value"]
    else:
        if not module.params.get("value"):
            module.fail_json(msg="No value specified for key {}".format(key))
        value = module.params.get("value")
        if value != result["value"]:
            if not module.check_mode:
                write_value(key, value)
            result["new_value"] = value
            result["changed"] = True

    module.exit_json(**result)


def main():
    run_module()


if __name__ == "__main__":
    main()
