slack-message:
  local.slack.post_message:
    - tgt: {{ data['id'] }}
    - args:
      - channel: '#ops'
      - from_name: 'burnyd'
      - message: '{{ data['id'] }} is currently being added to the network'
      - api_key: 
