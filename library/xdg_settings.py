from __future__ import absolute_import, division, print_function

from ansible.module_utils.basic import AnsibleModule


def main():
    argument_spec = dict(
        key=dict(
            type="str",
            required=True,
        ),
        subkey=dict(type="str"),
        value=dict(type="str"),
    )

    module = AnsibleModule(
        argument_spec=argument_spec,
        supports_check_mode=True,
    )

    result = dict(
        changed=False,
        previous_value="",
        value="",
    )

    cmd_path = module.get_bin_path("xdg-settings")

    read_cmd = [cmd_path, "get", module.params.get("key")]
    if module.params.get("subkey"):
        read_cmd.append(module.params.get("subkey"))

    rc, out, err = module.run_command(read_cmd)
    if rc != 0:
        module.fail_json(msg='"{}" failed: {}'.format(read_cmd, err))
    out = out.strip()

    result["previous_value"] = out
    value = module.params.get("value")
    result["value"] = value
    if out != value:
        result["changed"] = True
        if not module.check_mode:
            write_cmd = [cmd_path, "set", module.params.get("key")]
            if module.params.get("subkey"):
                write_cmd.append(module.params.get("subkey"))
            write_cmd.append(value)
            rc, out, err = module.run_command(write_cmd)
            if rc != 0:
                module.fail_json(msg='"{}" failed: {}'.format(write_cmd, err))

    module.exit_json(**result)


if __name__ == "__main__":
    main()
