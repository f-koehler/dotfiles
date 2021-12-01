from __future__ import absolute_import, division, print_function

from ansible.module_utils.basic import AnsibleModule


def main():
    argument_spec = dict(
        type=dict(
            type="str",
            required=True,
        ),
        application=dict(
            type="str",
            required=True,
        ),
    )

    module = AnsibleModule(
        argument_spec=argument_spec,
        supports_check_mode=True,
    )

    result = dict(
        changed=False,
        previous_default="",
        default="",
    )

    cmd_path = module.get_bin_path("xdg-mime")

    type_ = module.params.get("type")
    read_cmd = [cmd_path, "query", "default", type_]

    rc, out, err = module.run_command(read_cmd)
    if rc != 0:
        module.fail_json(msg='"{}" failed: {}'.format(read_cmd, err))
    out = out.strip()

    result["previous_default"] = out
    application = module.params.get("application")
    result["default"] = application
    if out != application:
        result["changed"] = True
        if not module.check_mode:
            write_cmd = [cmd_path, "default", application, type_]
            rc, out, err = module.run_command(write_cmd)
            if rc != 0:
                module.fail_json(msg='"{}" failed: {}'.format(write_cmd, err))

    module.exit_json(**result)


if __name__ == "__main__":
    main()
