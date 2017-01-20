# # This explore is intended to be JUST the Desk generated data (not Maestro data)
# # You'll probably want to replace this with the existing Desk block you have.
# # See the longer discussion in 'helpdesk_integration' documents

connection: "your_connection_here" # Replace with your connection name

include: "desk.*.view.lkml" # include all views that start with 'desk.'


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
