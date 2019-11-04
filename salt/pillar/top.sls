base:
  {% for index in range(1, 3) -%}
  'base_lab_Spine{{ index }}':
    - base_lab_Spine{{ index }}
  {% endfor -%}
  'base_lab_Leaf1':
    - base_lab_Leaf1
  'base_lab_Leaf2':
    - base_lab_Leaf2
  'base_lab_Leaf3':
    - base_lab_Leaf3
  'base_lab_Leaf4':
    - base_lab_Leaf4
