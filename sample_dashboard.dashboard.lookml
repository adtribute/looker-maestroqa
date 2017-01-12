- dashboard: sample_dashboard
  title: Sample Dashboard
  layout: tile
  tile_size: 100

  filters:

  elements:

    - name: answers_last_month
      title: Total Grades
      type: single_value
      explore: rubric_answers
      measures: answers.count
      note:
        text: "Last 30 days"
        state: expanded
        display: below
      filters:
        answers.created_date : '30 days'
      height: 3
      width: 2
      refresh: 2 hours

    - name: templates_by_day in the last 30 days
      title: Overall Grades by Day
      type: looker_line
      explore: rubric_answers
      dimensions: answers.created_date
      measures: [answers.average_total_score, answers.count]
      filters:
        answers.created_date : '30 days'
      note:
        text: "Last 30 days"
        state: expanded
        display: below
      height: 3
      width: 4
      refresh: 2 hours

    - name: score_count_by_template
      title: Rubric Scores and Counts
      type: looker_column
      explore: rubric_answers
      dimensions: templates.name
      measures: [answers.count, answers.average_total_score]
      filters:
        answers.created_date : '30 days'
      height: 3
      width: 6
      refresh: 2 hours
      note:
        text: "Last 30 days"
        state: expanded
        display: below
      y_axis_combined: false

    - name: overall_scores_by_group
      title: Group Overall Scores
      note:
        text: "Last 30 days"
        state: expanded
        display: below
      type: looker_column
      explore: rubric_answers
      measures: answers.average_total_score
      dimensions: user_groups.group_name
      filters:
        answers.created_date : '30 days'
      height: 4
      width: 6
      refresh: 2 hours

    - name: rubric_scores_by_group
      title: Group Scores by Rubric
      note:
        text: "Last 30 days"
        state: expanded
        display: below
      type: table
      explore: rubric_answers
      measures: answers.average_total_score
      dimensions: [user_groups.group_name, templates.name]
      filters:
        answers.created_date : '30 days'
      height: 4
      width: 6
      refresh: 2 hours

    - name: average_score_by_agent
      title: Agent Overall Scores
      note:
        text: "Last 30 days"
        state: expanded
        display: below
      type: looker_column
      explore: rubric_answers
      measures: answers.average_total_score
      dimensions: helpdesk_id_email.email
      series_labels:
        helpdesk_id_email.email: 'Email'
      filters:
        answers.created_date : '30 days'
      height: 4
      width: 6
      refresh: 2 hours

    - name: rubric_scores_by_agent
      title: Agent Scores by Rubric
      note:
        text: "Last 30 days"
        state: expanded
        display: below
      type: table
      explore: rubric_answers
      measures: answers.average_total_score
      dimensions: [helpdesk_id_email.email, templates.name]
      filters:
        answers.created_date : '30 days'
      height: 4
      width: 6
      refresh: 2 hours
