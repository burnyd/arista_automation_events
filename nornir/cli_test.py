import nornir.core
from nornir import InitNornir
from nornir.plugins.tasks import commands
from nornir.plugins.functions.text import print_result
from nornir.plugins.tasks import networking


nr = InitNornir(config_file="config.yaml")

facts_test = nr.filter(site="nyc", role="leaf")

result = facts_test.run(task=networking.napalm_cli, commands=["show version"])

print_result(result)
