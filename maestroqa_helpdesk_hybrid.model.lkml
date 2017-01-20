# # This is the model that defines the explores for joins between MaestroQA
# # data and helpdesk data. You'll want to ensure you include the maestroqa model
# # as well as whichever heldesk models you want.
#
# # You can then extend any explore from the included models and join with
# # whichever views you like
#
# # Note that we don't include views here since those are included by the models

connection: "your_connection_here" # Replace with your connection name

include: "maestroqa.model.lkml"
include: "zendesk.model.lkml" # comment this out if you don't want use zendesk
include: "desk.model.lkml" # comment this out if you don't use desk

include: "*.dashboard.lookml"  # include all dashboards in this project


# # If you want to use an explore from one of the included models you can do that
# # directly without having to write any code here
# # e.g. you can reference the 'templates' explore from the maestroqa model directly

# # If you want to use an explore that pulls from multiple models, either extend
# # an existing explore
explore:  answers_ticket_extend { # Extends usage example
  extends: [rubric_answers]
  join: zendesk_tickets {
    from: zendesk_tickets
    relationship: many_to_one
    sql_on: ${answers.gradable_id} = ${zendesk_tickets.id} ;;
 }
}

# # Alternatively, you can build from scratch here
explore: answers_ticket_scratch {
  from: answers
  join: zendesk_tickets {
    from: zendesk_tickets
    relationship: many_to_one
    sql_on: ${answers_ticket_scratch.gradable_id} = ${zendesk_tickets.id} ;;
  }
}
