- dashboard: sample_dashboard
  title: Sample Dashboard
  layout: tile
  tile_size: 100

  filters:

  elements:
    - name: total_answers
      title: Total answers
      type: single_value
      explore: rubric_answers
      measures: answers.count
      height: 2
      width: 2
      refresh: 2 hours
      note:
        text: "Note text"
        state: expanded
        display: above

    - name: answers_last_month
      title: Number of answers in the last 30 days
      type: single_value
      explore: rubric_answers
      measures: answers.count
      filters:
        answers.created_date : '30 days'
      height: 2
      width: 2
      refresh: 2 hours
      note:
        text: "Note text"
        state: expanded
        display: above

    - name: average_score_by_agent
      title: Average Total Score by Agent
      type: looker_bar
      explore: rubric_answers
      measures: answers.average_total_score
      pivots: helpdesk_id_email.email
      height: 4
      width: 4
      refresh: 2 hours


