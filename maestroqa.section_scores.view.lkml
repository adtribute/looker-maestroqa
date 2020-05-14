view: section_scores {
  sql_table_name: maestro.section_scores ;;

  dimension: answer_id {
    description: "Identifier of the answer this section-scores belongs to"
    type: string
    # hidden: yes
    sql: ${TABLE}.answer_id ;;
  }

  dimension: gradable_id {
    description: "String cast ticket/case id this answer relates to"
    type: string
    sql: ${TABLE}.gradable_id ;;
  }

  dimension: normalized_score {
    description: "Normalization of this section's score"
    type: number
    sql: ${TABLE}.normalized_score ;;
  }

  dimension: section_id {
    description: "Identifier of the section this score refers to"
    type: string
    # hidden: yes
    sql: ${TABLE}.section_id ;;
  }

  dimension: section_score {
    description: "Raw score of this section"
    type: number
    sql: ${TABLE}.section_score ;;
  }

  dimension: template_id {
    description: "Identifier of the rubric template this section belongs to"
    type: string
    # hidden: yes
    sql: ${TABLE}.template_id ;;
  }

  dimension_group: row_updated {
    description: "UTC time this row was last updated"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.row_updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [templates.name, templates.template_id, sections.section_id, answers.answer_id]
  }
}
