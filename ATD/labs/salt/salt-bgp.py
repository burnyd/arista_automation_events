import salt.modules.cmdmod

__salt__ = {
    'cmd.run': salt.modules.cmdmod._run_quiet,
}

def get_AS():
    grains = {}
    bgp_as = __salt__['cmd.run']("FastCli -p 15 -c 'show ip bgp summary'| awk 'NR==2{print $7}'")
    grains['bgp_as'] = bgp_as
    return grains

if __name__ == "__main__":
    get_AS()
