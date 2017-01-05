view: question_scores {
  sql_table_name: maestro.question_scores ;;

  dimension: answer_id {
    description: "ID of the answer this question's score belongs to"
    type: string
    # hidden: yes
    sql: ${TABLE}.answer_id ;;
  }

  dimension: comment {
    description: "Comment regarding the answer to this question"
    type: string
    sql: ${TABLE}.comment ;;
  }

  dimension: gradable_id {
    description: "Integer ticket/case id this answer relates to"
    type: number
    sql: ${TABLE}.gradable_id ;;
  }

  dimension: is_na {
    description: "Whether or not this question was marked as N/A"
    type: yesno
    sql: ${TABLE}.is_na ;;
  }

  dimension: normalized_score {
    description: "Normalization of the raw score"
    type: number
    sql: ${TABLE}.normalized_score ;;
  }

  dimension: option_id {
    description: "ID of the option that was used to answer this question"
    type: string
    # hidden: yes
    sql: ${TABLE}.option_id ;;
  }

  dimension: question_id {
    description: "Identifier of the question that was answered"
    type: string
    # hidden: yes
    sql: ${TABLE}.question_id ;;
  }

  dimension: raw_score {
    description: "The numerical score number that was entered"
    type: number
    sql: ${TABLE}.raw_score ;;
  }

  dimension: template_id {
    description: "Identifier of the rubric template used to grade this ticket"
    type: string
    # hidden: yes
    sql: ${TABLE}.template_id ;;
  }

  measure: count {
    type: count
    drill_fields: [options.option_id, answers.answer_id, templates.name, templates.template_id, questions.question_id]
  }

  measure: average_raw_score {
    type:  average
    sql: ${raw_score} ;;
  }
}
