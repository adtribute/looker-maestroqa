- dashboard: grade_breakdown
  title: Grade Breakdown
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
      width: 3
      refresh: 2 hours
      listen:
        grade_created_date: answers.created_date

    - name: average_grade
      title: Average Grade
      type: single_value
      model: maestroqa
      explore: rubric_answers
      measures: [answers.average_total_score]
      height: 3
      width: 3
      listen:
        grade_created_date: answers.created_date

    - name: grades_by_day
      title: Overall Grades by Day
      type: looker_column
      model: maestroqa
      explore: rubric_answers
      dimensions: [answers.created_date]
      measures: [answers.count, answers.average_total_score]
      height: 3
      width: 6
      listen:
        grade_created_date: answers.created_date
      sorts: [answers.created_date desc]
      limit: '500'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: true
      limit_displayed_rows: false
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types:
        answers.average_total_score: line
      x_axis_label_rotation: -30

    - name: grades_by_template
      title: Rubric Scores and Counts
      type: looker_column
      model: maestroqa
      explore: rubric_answers
      dimensions: [templates.name]
      measures: [answers.average_total_score, answers.count]
      height: 4
      width: 6
      listen:
        grade_created_date: answers.created_date
      sorts: [answers.count desc]
      query_timezone: America/Los_Angeles
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: true
      limit_displayed_rows: false
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      show_null_points: true
      point_style: circle
      hidden_series: []
      series_types: {}
      reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
          margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
          color: "#000000", label: Average Score}]


    - name: score_breakdown
      title: Score Breakdown
      type: looker_pie
      model: maestroqa
      explore: rubric_answers
      dimensions: [answers.total_score_tiered]
      measures: [answers.count]
      height: 4
      width: 6
      listen:
        grade_created_date: answers.created_date
      sorts: [answers.total_score_tiered desc]
      limit: '1000'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      value_labels: legend
      label_type: labPer
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: true
      limit_displayed_rows: false
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}
      colors: ["#7FCDAE", "#B1DB7A", "#CADF79", "#E2DF78", "#E5C877", "#E7AF75", "#EB9474"]
      series_colors: {}

    - name: top_scoring_groups
      title: Top Scoring Groups
      type: looker_bar
      model: maestroqa
      explore: rubric_answers
      dimensions: [user_groups.group_name]
      measures: [answers.average_total_score]
      height: 3
      width: 6
      listen:
        grade_created_date: answers.created_date
      sorts: [answers.average_total_score desc]
      limit: '5'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: true
      limit_displayed_rows: false
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}
      y_axis_unpin: true
      y_axis_min: ['85']
      y_axis_max: ['100']


    - name: rubric_scores_by_group
      title: Group Scores by Rubric
      type: table
      model: maestroqa
      explore: rubric_answers
      dimensions: [templates.name, user_groups.group_name]
      measures: [answers.average_total_score]
      height: 6
      width: 6
      refresh: 2 hours
      listen:
        grade_created_date: answers.created_date
      sorts: [answers.average_total_score desc]
      limit: '1000'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      show_view_names: false
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: gray
      limit_displayed_rows: false



    - name: bottom_scorers
      title: Bottom Scoring Groups
      type: looker_bar
      model: maestroqa
      explore: rubric_answers
      dimensions: [user_groups.group_name]
      measures: [answers.count, answers.average_total_score]
      height: 3
      width: 6
      listen:
        grade_created_date: answers.created_date
      filters:
        answers.average_total_score: "<94.27"
      sorts: [answers.average_total_score desc]
      limit: '5'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: true
      limit_displayed_rows: false
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}
      y_axis_unpin: true
      y_axis_min: ['85']
      y_axis_max: ['100']
      hidden_series: [answers.count]
