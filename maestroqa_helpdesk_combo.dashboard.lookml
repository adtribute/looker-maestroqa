# # This is the dashboard that you probably want to use for elements that come from both
# # MaestroQA AND Helpdesk data.

- dashboard: maestroqa_helpdesk_combo
  title: Maestroqa Helpdesk Combo
  layout: tile
  tile_size: 100

  filters:

  elements:
  # # 3 elements here for your viewing pleasure
    # # total_templates: from an explore that's included (but not defined) in this dashboard's model
    - name: total_templates
      title: Number of templates
      type: single_value
      explore: templates
      measures: templates.count
      height: 3
      width: 2
      refresh: 2 hours
    # # extends_example: from an explore that extends an explore that's included (but not defined) in the model
    - name: extends_example
      title: 'Extends Explore: Number of tickets'
      type: single_value
      explore: answers_ticket_extend
      filters:
        zendesk_tickets.subject: '-null'
      measures: answers.count
      height: 3
      width: 2
      refresh: 2 hours
    # # scratch_example: from an explore that is defined in the model, but uses views that are included from
    # #                  the various included models
    - name: scratch_example
      title: 'Scratch Explore: Number of tickets'
      type: single_value
      explore: answers_ticket_scratch
      filters:
        zendesk_tickets.subject: '-null'
      measures: answers_ticket_scratch.count
      height: 3
      width: 2
      refresh: 2 hours


