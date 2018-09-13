slack-message:
  local.slack.post_message:
    - tgt: {{ data['id'] }}
    - args:
      - channel: '#ops'
      - from_name: 'burnyd'
      - message: '{{ data['id'] }} is currently being added to the network'
      - api_key: xoxp-99608234580-99623613687-296385839799-ca3e9ead6b42479c37f9973f48759350
