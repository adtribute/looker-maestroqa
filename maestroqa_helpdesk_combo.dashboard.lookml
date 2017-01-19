# # This is the dashboard that you probably want to use for elements that come from both
# # MaestroQA AND Helpdesk data.

- dashboard: maestroqa_helpdesk_combo
  title: Maestroqa Helpdesk Combo
  layout: tile
  tile_size: 100

  filters:

  elements:
    - name: hello_world
      type: looker_column
