from nornir import InitNornir
from nornir.plugins.functions.text import print_result
from nornir.plugins.tasks.networking import napalm_cli

nr = InitNornir(config_file="config.yaml")


"""def rollback_diff(task):

    diff_cmds = ["diff running-config flash:rollback-0"]

    task.run(
        name="Run diff between running config and rollback config.",
        task=napalm_cli,
        commands=diff_cmds,
    )
"""

def commands(task):

    test_commands = ["show ip route"]

    task.run(
    name="Test some routing commands",
    task=napalm_cli,
    commands=test_commands,
    )



#def rollback(task):

#    rollback_cmds = ["configure replace flash:rollback-0", "write memory"]

#    task.run(
#        name="Run diff between running config and rollback config.",
#        task=napalm_cli,
#        commands=rollback_cmds,
#    )


result = nr.run(task=commands)
print_result(result)
