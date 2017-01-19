# # This is the dashboard that you probably want to use for elements that come from both
# # MaestroQA AND Helpdesk data.

- dashboard: maestroqa_helpdesk_combo
  title: Maestroqa Helpdesk Combo
  layout: tile
  tile_size: 100

  filters:

  elements:
    - name: total_templates
      title: Number of templates
      type: single_value
      explore: templates
      measures: templates.count
      height: 3
      width: 2
      refresh: 2 hours
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
