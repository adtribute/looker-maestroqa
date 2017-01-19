# # This is the model that defines the explores for joins between MaestroQA
# # data and helpdesk data. You'll want to ensure you include the maestroqa model
# # as well as whichever heldesk models you want.
#
# # You can then extend any explore from the included models and join with
# # whichever views you like
#
# # Note that we don't include views here since those are included by the models

connection: "staging_postgres"
#
# include: "maestroqa.model.lkml"
# # include: "helpdesk.model.lkml" # -- helpdesk model gets included here
# include: "*.dashboard.lookml"  # include all dashboards in this project
#
# # # Select the views that should be a part of this model,
# # # and define the joins that connect them together.
# #
# # explore: order_items {
# #   join: orders {
# #     sql_on: ${orders.id} = ${order_items.order_id}
# #   }
# #
# #   join: users {
# #     sql_on: ${users.id} = ${orders.user_id}
# #   }
# # }
#
# explore:  extendo {
#   extends: [templates]
# }
#
