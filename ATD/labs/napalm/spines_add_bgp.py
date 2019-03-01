from napalm import get_network_driver
driver = get_network_driver('eos')

spines = ['spine1','spine2']

for spine in spines:
  dev = driver(hostname=spine, username='arista',
               password='arista')
  dev.open()
  dev.load_merge_candidate(filename= spine+'-BGP-Lab.cfg')
  diffs = dev.compare_config()

  if len(diffs) > 0:
      print(diffs)
      decision = raw_input("Would you like to commit this change? Y/N\n")
      if decision == "Y":    
        dev.commit_config()
      else: 
        print "Goodbye!"
  else:
        print('No changes needed')
        dev.discard_config()
        dev.close()


