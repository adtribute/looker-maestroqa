# # This is a sample of what a desk.users view  might look like
# # See the API for user structure: http://dev.desk.com/API/users/
#
# # You'll want to replace this entirely with the structure of your existing
# # (or custom) helpdesk Looker block

view: desk_users {
  sql_table_name: public.desk_users ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: available {
    type: yesno
    sql: ${TABLE}.available ;;
  }

  dimension: avatar {
    type: string
    sql: ${TABLE}.avatar ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: current_login {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.current_login_at ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: email_verified {
    type: string
    sql: ${TABLE}.email_verified ;;
  }

  dimension_group: last_login {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_login_at ;;
  }

  dimension: level {
    type: string
    sql: ${TABLE}.level ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: public_name {
    type: string
    sql: ${TABLE}.public_name ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, public_name]
  }
}
