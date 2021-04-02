import ncclient.manager
import xml.dom.minidom

 
subtree_filter2='<interfaces xmlns="http://openconfig.net/yang/interfaces"><interface><name>Ethernet1</name></interface></interfaces>'
 
with ncclient.manager.connect(host='base_lab_Leaf1', username='admin', password='admin', port=22, hostkey_verify=False) as m:
  	get_result = m.get( filter=('subtree', subtree_filter2))
 
print get_result
