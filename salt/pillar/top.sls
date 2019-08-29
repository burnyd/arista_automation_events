base:
  {% for index in range(1, 3) -%}
  'base-lab_Spine{{ index }}':
    - base-lab_Spine{{ index }}
  {% endfor -%}
  'base-lab_Leaf1':
    - base-lab_Leaf1
  'base-lab_Leaf2':
    - base-lab_Leaf2
  'base-lab_Leaf3':
    - base-lab_Leaf3
  'base-lab_Leaf4':
    - base-lab_Leaf4
