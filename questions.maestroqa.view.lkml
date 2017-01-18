view: questions {
  sql_table_name: maestro.questions ;;

  dimension: question_id {
    description: "Identifier of this question"
    primary_key: yes
    type: string
    sql: ${TABLE}.question_id ;;
  }

  dimension: question_index {
    description: "Index of this question within its section"
    hidden: yes
    type: number
    sql: ${TABLE}.question_index ;;
  }

  dimension: description {
    description: "If present, is a description for this question"
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: question {
    description: "The text of the question"
    type: string
    sql: ${TABLE}.question ;;
  }

  dimension: score_max {
    description: "The maximum score for this question"
    type: number
    sql: ${TABLE}.score_max ;;
  }

  dimension: score_min {
    description: "The minimum score for this question"
    type: number
    sql: ${TABLE}.score_min ;;
  }

  dimension: score_system {
    description: "What type of score system is used. Can be either 'linear' or 'custom'"
    type: string
    sql: ${TABLE}.score_system ;;
  }

  dimension: section_id {
    description: "Identifier of the section this question belongs to"
    type: string
    # hidden: yes
    sql: ${TABLE}.section_id ;;
  }

  dimension: template_id {
    description: "Identifier of the rubric template this question belongs to"
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
      question_id,
      templates.name,
      templates.template_id,
      sections.section_id,
      options.count,
      question_scores.count
    ]
  }
}
