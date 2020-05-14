view: appeal_answers {
  sql_table_name: maestro.appeal_answers ;;

  dimension: appeal_id {
    description: "ID of the appeal that contains this answer"
    type: string
    sql: ${TABLE}.appeal_id ;;
  }

  dimension: answer_type {
    # values are constrained to 'original', 'updated'
    description: "The type of this answer as it relates to the appeal"
    type: string
    sql: ${TABLE}.answer_type ;;
  }

  dimension: answer_id {
    description: "ID of the answer this appeal is referencing"
    type: string
    sql: ${TABLE}.answer_id ;;
  }

  dimension: question_id {
    description: "ID of the question this answer refers to
    type: string
    sql: ${TABLE}.question_id ;;
  }

  dimension: option_id {
    description: "ID of the option for this answer"
    type: string
    sql: ${TABLE}.option_id ;;
  }

  dimension: label {
    description: "The description of the option"
    type: string
    sql: ${TABLE}.label ;;
  }

  dimension: score {
    description: "The numerical score that was entered for this question"
    type: number
    sql: ${TABLE}.score ;;
  }

  dimension: is_na {
    description: "Whether or not this question was marked as N/A"
    type: yesno
    sql: ${TABLE}.is_na ;;
  }

  dimension: answer_comment {
    description: "Comment regarding the answer to this question"
    type: string
    sql: ${TABLE}.answer_comment ;;
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
