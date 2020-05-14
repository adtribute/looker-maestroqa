view: feedback_selections {
  sql_table_name: maestro.feedback_selections ;;

  dimension: answer_id {
    description: "ID of the answer this question's score belongs to"
    type: string
    # hidden: yes
    sql: ${TABLE}.answer_id ;;
  }

  dimension: gradable_id {
    description: "String cast ticket/case id this answer relates to"
    type: string
    sql: ${TABLE}.gradable_id ;;
  }

  dimension: template_id {
    description: "Identifier of the rubric template used to grade this ticket"
    type: string
    # hidden: yes
    sql: ${TABLE}.template_id ;;
  }

  dimension: question_id {
    description: "Identifier of the question that was answered"
    type: string
    # hidden: yes
    sql: ${TABLE}.question_id ;;
  }

  dimension: option_id {
    description: "Identifier of a feedback option that was selected for this question"
    type: string
    # hidden: yes
    sql: ${TABLE}.option_id ;;
  }

  dimension_group: row_updated {
    description: "UTC time this row was last updated"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.row_updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [feedback_options.option_id, answers.answer_id, templates.name, templates.template_id, questions.question_id]
  }

}
