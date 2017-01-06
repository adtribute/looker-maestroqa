- dashboard: sample_dashboard
  title: Sample Dashboard
  layout: tile
  tile_size: 100

  filters:

  elements:
    - name: total_answers
      title: Total answers
      type: single_value
      explore: answers
      measures: answers.count
      height: 4
      width: 4
      refresh: 2 hours
      note:
        text: "Note text"
        state: expanded
        display: above
