base:
  '*':
    - ntp
  'leaf*':
    - bgp_leaf:
  'spine*':
    - bgp_spine:
