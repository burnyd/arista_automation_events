base:
  {% for index in range(1, 3) -%}
  'base-lab_Spine{{ index }}':
    - spine{{ index }}
  {% endfor -%}
  'base-lab_Lab1':
    - leaf1
  'base-lab_Lab2':
    - leaf2
  'base-lab_Lab3':
    - leaf3
  'base-lab_Lab4':
    - leaf4
