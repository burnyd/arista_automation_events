from cvprac.cvp_client import CvpClient
from pprint import pprint
import json
import sys
from jinja2 import Environment, FileSystemLoader
import itertools

robotlist = []
countlist = []

client = CvpClient()
client.connect(['10.20.30.142'],'daniel', 'daniel123')
inventory = client.api.get_inventory()

def initcvpyaml():
  sys.stdout = open('cvp.yaml', 'w')
  print '---'
  print 'TRANSPORT: https'
  print 'PORT: 443'
  print 'USERNAME: daniel'
  print 'PASSWORD: daniel123'
  print '   '
  print 'RUNFORMAT: suite'
  print '   ' 
  print 'PROD_TAGS:'
  print '  - ignoretags'
  print '   '
  print 'testfiles:'
  print '  - network_validation'
  print '   ' 
  print 'nodes:'
  count = 0 
  for switches in robotlist:
      count+= 1
      print  '  SW' + str(count) + ':'
      print    '    host:' + ' ' + str(switches)
      
def inityaml():
  for i in range(len(inventory)):
      appendlist = inventory[i]['ipAddress']
      robotlist.append(appendlist)

def countadd():
  count = 0
  for countswitches in robotlist:
    count+= 1
    countlist.append(count)

def createtest():
  env = Environment(loader=FileSystemLoader('templates'))
  template = env.get_template('bgptest.j2')
  output = template.render(robotlist=robotlist, countlist=countlist)
  with open("network_validation/bgp-test.robot", "wb") as fh:
    fh.write(output)
    
inityaml()
initcvpyaml()
countadd()
createtest()

