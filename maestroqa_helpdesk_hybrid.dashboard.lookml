# # This is the dashboard that you probably want to use for elements that come from both
# # MaestroQA AND Helpdesk data.

- dashboard: maestroqa_helpdesk_hybrid
  title: Maestroqa Helpdesk Hybrid
  layout: tile
  tile_size: 100

  filters:

  elements:
  # # EXAMPLE ELEMENTS
  # # # total_templates: from an explore that's included (but not defined) in this dashboard's model
  # - name: total_templates
  #   title: Number of templates
  #   type: single_value
  #   explore: templates
  #   measures: templates.count
  #   height: 3
  #   width: 2
  #   refresh: 2 hours
  # # # extends_example: from an explore that extends an explore that's included (but not defined) in the model
  # - name: extends_example
  #   title: 'Extends Explore: Number of tickets'
  #   type: single_value
  #   explore: answers_ticket_extend
  #   filters:
  #     zendesk_tickets.subject: '-null'
  #   measures: answers.count
  #   height: 3
  #   width: 2
  #   refresh: 2 hours
  # # # scratch_example: from an explore that is defined in the model, but uses views that are included from
  # # #                  the various included models
  # - name: scratch_example
  #   title: 'Scratch Explore: Number of tickets'
  #   type: single_value
  #   explore: answers_ticket_scratch
  #   filters:
  #     zendesk_tickets.subject: '-null'
  #   measures: answers_ticket_scratch.count
  #   height: 3
  #   width: 2
  #   refresh: 2 hours

    - name: number_of_tickets
      title: Total Number of Tickets
      type: single_value
      model: zendesk
      explore: zendesk_tickets
      measures: zendesk_tickets.count
      height: 3
      width: 3
      refresh: 2 hours

    - name: number_of_grades
      title: Total Number of Grades
      type: single_value
      model: maestroqa
      explore: rubric_answers
      measures: answers.count
      height: 3
      width: 3
      refresh: 2 hours


    - name: tickets_by_day
      title: Number of tickets by Day of Week
      type: looker_column
      model: zendesk
      explore: zendesk_tickets
      dimensions: [zendesk_tickets.created_day_of_week]
      measures: [zendesk_tickets.count]
      height: 3
      width: 6
      listen:
        ticket_created_day_of_week: zendesk_tickets.created_day_of_week
      sorts: [zendesk_tickets.created_day_of_week]
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
      x_axis_label_rotation: -30


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

    - name: most_active_agents
      title: Most Active Agents
      type: looker_bar
      model: zendesk
      explore: zendesk_tickets
      dimensions: [zendesk_users.name]
      measures: [zendesk_tickets.count]
      height: 3
      width: 6
      listen:
        zendesk_tickets_count: zendesk_tickets.count
      sorts: [zendesk_tickets.count desc]
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
      y_axis_labels: ['Agent Name']
      x_axis_labels: ['# of Assigned tickets']
      y_axis_min: ['1000']
      y_axis_max: ['1150']


    - name: least_active_agents
      title: Least Active Agents
      type: looker_bar
      model: zendesk
      explore: zendesk_tickets
      dimensions: [zendesk_users.name]
      measures: [zendesk_tickets.count_2, zedesk_tickets.count]
      height: 3
      width: 6
      listen:
        zendesk_tickets_count: zendesk_tickets.count
      sorts: [zendesk_tickets.count asc]
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
      hidden_series: [zendesk_users.count_2]
      y_axis_labels: ['Agent Name']
      x_axis_labels: ['# of Assigned tickets']
      y_axis_min: ['1000']
      y_axis_max: ['1150']
