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

    - name: templates_by_day
      title: Templates by day
      type: table
      explore: rubric_answers
      dimensions: answers.created_date
      measures: [answers.average_total_score, answers.count]
      height: 4
      width: 4
      refresh: 2 hours

    - name: score_count_by_template
      title: Templates
      type: looker_column
      explore: rubric_answers
      dimensions: templates.name
      measures: [answers.count, answers.average_total_score]
      height: 4
      width: 4
      refresh: 2 hours
