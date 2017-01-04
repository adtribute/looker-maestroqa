view: options {
  sql_table_name: maestro.options ;;

  dimension: option_id {
    description: "Identifier of this option"
    primary_key: yes
    type: string
    sql: ${TABLE}.option_id ;;
  }

  dimension: label {
    description: "String label of this option"
    type: string
    sql: ${TABLE}.label ;;
  }

  dimension: points {
    description: "How many points this option is worth"
    type: number
    sql: ${TABLE}.points ;;
  }

  dimension: question_id {
    description: "The identifier of the question that this option belongs to"
    type: string
    # hidden: yes
    sql: ${TABLE}.question_id ;;
  }

  dimension: section_id {
    description: "The identifier of the section that this option belongs to"
    type: string
    # hidden: yes
    sql: ${TABLE}.section_id ;;
  }

  dimension: template_id {
    description: "The identifier of the rubric template this option belongs to"
    type: string
    # hidden: yes
    sql: ${TABLE}.template_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      option_id,
      templates.name,
      templates.template_id,
      sections.section_id,
      questions.question_id,
      question_scores.count
    ]
  }
}
