view: answers {
  sql_table_name: maestro.answers ;;

  dimension: answer_id {
    description: "Unique identifier for this answer"
    primary_key: yes
    type: string
    sql: ${TABLE}.answer_id ;;
  }

  dimension: answer_type {
    # values are constrained to 'grading', 'calibration_review', 'calibration_final
    description: "What type of rubric answer this is"
    type: string
    sql: ${TABLE}.answer_type ;;
  }

  dimension_group: created {
    description: "UTC time this answer was created"
    convert_tz: yes
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at ;;
  }

  dimension: general_notes {
    description: "Notes associated with this particular answer"
    type: string
    sql: ${TABLE}.general_notes ;;
  }

  dimension: gradable_id {
    description: "Integer ticket/case id this answer relates to"
    type: number
    sql: ${TABLE}.gradable_id ;;
  }

  dimension: gradee_id {
    description: "Zendesk/Desk.com/Freshdesk agent ID of the agent being graded"
    type: number
    sql: ${TABLE}.gradee_id ;;
  }

  dimension: grader_email {
    description: "Email address of the user doing the grading"
    type: string
    sql: ${TABLE}.grader_email ;;
  }

  dimension: is_deleted {
    description: "Whether or not this answer has been deleted"
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: template_id {
    description: "The identity of the template used by the grader for this answer"
    type: string
    # hidden: yes
    sql: ${TABLE}.template_id ;;
  }

  dimension: total_score {
    description: "The total weighted score"
    type: number
    sql: ${TABLE}.total_score ;;
  }

  dimension: total_score_tiered {
    description: "The total weighted score"
    type: tier
    tiers: [0,50,70,80,90]
    style: integer
    sql: ${total_score} ;;
  }

  dimension_group: updated {
    description: "UTC time this answer was last updated"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [answer_id, templates.name, templates.template_id, question_scores.count, section_scores.count]
  }

  measure: average_total_score {
    type: average
    sql:  ${total_score} ;;
    value_format_name: decimal_2
  }

}
