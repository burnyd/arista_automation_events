slack-message:
  local.slack.post_message:
    - tgt: labaccess.arista.lab
    - args:
      - channel: '#ops'
      - from_name: 'burnyd'
      - message: '{{ data.host }} has an issue with BGP on {{ data.yang_message.bgp.neighbors.neighbor.keys()[0] }}'
      - api_key: 'xoxp-99608234580-99623613687-438108301027-67f02acac0e1518db34660eec1fb18c2'

