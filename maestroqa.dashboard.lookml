- dashboard: sample_dashboard
  title: Sample Dashboard
  layout: tile
  tile_size: 100

  filters:
    - name: grade_created_date
      title: "Grade Creation Date"
      type: date_filter
      field: answers.created_date
      default_value: 'last 30 days'

  elements:

    - name: total_grades
      title: Total Grades
      type: single_value
      explore: rubric_answers
      measures: answers.count
      height: 3
      width: 2
      refresh: 2 hours
      listen:
        grade_created_date: answers.created_date

    - name: grades_by_day
      title: Overall Grades by Day
      type: looker_line
      explore: rubric_answers
      dimensions: answers.created_date
      measures: [answers.average_total_score, answers.count]
      height: 3
      width: 4
      refresh: 2 hours
      listen:
        grade_created_date: answers.created_date

    - name: grades_by_template
      title: Rubric Scores and Counts
      type: looker_column
      explore: rubric_answers
      dimensions: templates.name
      measures: [answers.count, answers.average_total_score]
      height: 3
      width: 6
      refresh: 2 hours
      y_axis_combined: false
      listen:
        grade_created_date: answers.created_date

    - name: overall_scores_by_group
      title: Group Overall Scores
      type: looker_column
      explore: rubric_answers
      measures: answers.average_total_score
      dimensions: user_groups.group_name
      height: 4
      width: 6
      refresh: 2 hours
      listen:
        grade_created_date: answers.created_date

    - name: rubric_scores_by_group
      title: Group Scores by Rubric
      type: table
      explore: rubric_answers
      measures: answers.average_total_score
      dimensions: [user_groups.group_name, templates.name]
      height: 4
      width: 6
      refresh: 2 hours
      listen:
        grade_created_date: answers.created_date

    - name: overall_scores_by_agent
      title: Agent Overall Scores
      type: looker_column
      explore: rubric_answers
      measures: answers.average_total_score
      dimensions: helpdesk_id_email.email
      height: 4
      width: 6
      refresh: 2 hours
      listen:
        grade_created_date: answers.created_date

    - name: rubric_scores_by_agent
      title: Agent Scores by Rubric
      type: table
      explore: rubric_answers
      measures: answers.average_total_score
      dimensions: [helpdesk_id_email.email, templates.name]
      height: 4
      width: 6
      refresh: 2 hours
      listen:
        grade_created_date: answers.created_date
