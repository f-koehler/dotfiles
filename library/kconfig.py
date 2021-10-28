from __future__ import absolute_import, division, print_function

from ansible.module_utils.basic import AnsibleModule


def main():
    argument_spec = dict(
        file=dict(
            type="str",
            required=False,
        ),
        key=dict(
            type="str",
            required=True,
        ),
        type=dict(
            type="str",
            required=False,
            default="string",
            choices=["str", "string", "bool", "boolean"],
        ),
        state=dict(
            type="str",
            required=False,
            default="present",
            choices=["present", "absent"],
        ),
        groups=dict(
            type="list",
            elements="str",
            required=False,
        ),
        group=dict(
            type="str",
            required=False,
        ),
        value=dict(
            type="str",
            required=True,
        ),
    )

    module = AnsibleModule(
        argument_spec=argument_spec,
        mutually_exclusive=[["group", "groups"]],
        supports_check_mode=True,
    )

    result = dict(
        changed=False,
        previous_value="",
        value="",
    )

    common_flags = "--file {} --key {}".format(
        module.params.get("file"),
        module.params.get("key"),
    )
    if module.params.get("group"):
        common_flags += " --group {}".format(module.params.get("group"))
    elif module.params.get("groups"):
        for group in module.params.get("groups"):
            common_flags += " --group {}".format(group)

    kreadconfig5_path = module.get_bin_path("kreadconfig5")
    read_cmd = "{} {}".format(kreadconfig5_path, common_flags)
    rc, out, err = module.run_command(read_cmd)
    out = out.strip()

    if rc != 0:
        module.fail_json(msg='"{}" failed: {}'.format(read_cmd, err))

    value = module.params.get("value")
    result["previous_value"] = out
    result["value"] = value
    if out != value:
        result["changed"] = True
        result["value"] = value
        if not module.check_mode:
            kwriteconfig5_path = module.get_bin_path("kwriteconfig5")
            write_cmd = "{} {} {}".format(
                kwriteconfig5_path, common_flags, module.params.get("value")
            )
            if module.params.get("type") in ["bool", "boolean"]:
                write_cmd += " --type bool"

            rc, out, err = module.run_command(write_cmd)
            if rc != 0:
                module.fail_json(msg='"{}" failed: {}'.format(read_cmd, err))

    module.exit_json(**result)


if __name__ == "__main__":
    main()
