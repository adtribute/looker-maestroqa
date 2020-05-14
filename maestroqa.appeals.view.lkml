view: appeals {
  sql_table_name: maestro.appeals ;;

  dimension: appeal_id {
    description: "Unique identifier for this appeal"
    primary_key: yes
    type: string
    sql: ${TABLE}.appeal_id ;;
  }

  dimension: answer_id {
    description: "ID of the answer this appeal is referencing"
    type: string
    sql: ${TABLE}.answer_id ;;
  }

  dimension: gradee_id {
    description: "String-cast helpdesk agent ID of the agent that received the grade on this appeal"
    type: string
    sql: ${TABLE}.gradee_id ;;
  }

  dimension: template_id {
    description: "ID of the rubric used for the answer this appeal is referencing"
    type: string
    sql: ${TABLE}.template_id ;;
  }

  dimension: gradable_id {
    description: "String-cast helpdesk ticket id this appeal relates to"
    type: string
    sql: ${TABLE}.gradable_id ;;
  }

  dimension: gradee_email {
    description: "Email address of the agent receiving the grade"
    type: string
    sql: ${TABLE}.gradee_email ;;
  }

  dimension: grader_email {
    description: "Email address of the user doing the grading"
    type: string
    sql: ${TABLE}.grader_email ;;
  }

  dimension: requester_email {
    description: "Email address of the user requesting the appeal"
    type: string
    sql: ${TABLE}.requester_email ;;
  }

  dimension: reviewer_email {
    description: "Email address of the user reviewing the appeal"
    type: string
    sql: ${TABLE}.reviewer_email ;;
  }

  dimension: status {
    # values are constrained to 'pending', 'approved', 'denied'
    description: "Status of this appeal"
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: grader_error {
    description: "Whether or not the grade was the result of grader error"
    type: yesno
    sql: ${TABLE}.grader_error ;;
  }

  dimension_group: created {
    description: "UTC time this appeal was created"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: updated {
    description: "UTC time this appeal was last updated"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at ;;
  }

  dimension_group: resolved {
    description: "UTC time this appeal had status change to approved or denied"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.resolved_at ;;
  }

  dimension: is_deleted {
    description: "Whether or not this appeal has been deleted"
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension_group: row_updated {
    description: "UTC time this row was last updated"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.row_updated_at ;;
  }

  measure: count {
    type: count
  }

}
