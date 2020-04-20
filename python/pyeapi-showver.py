import pyeapi
import pprint

eapi_tup = pyeapi.client.connect(
    transport='http',
    host='127.0.0.1',
    username='arista',
    password='arista',
    port=8001,
)
eapi = pyeapi.client.Node(eapi_tup)

version_info = eapi.run_commands(['show version',])
pprint.pprint(version_info)

