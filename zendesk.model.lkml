## This explore is intended to be JUST the Zendesk generated data (not Maestro data)
#  You'll probably want to replace this with the existing Zendesk block you have.
#  See the longer discussion in 'helpdesk_integration' documents

connection: "staging_postgres"

include: "*.zendesk.view.lkml" # include all views that end in .zendesk
include: "*.zendesk.dashboard.lookml"  # include all dashboards that end in .zendesk


# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     sql_on: ${orders.id} = ${order_items.order_id}
#   }
#
#   join: users {
#     sql_on: ${users.id} = ${orders.user_id}
#   }
# }
