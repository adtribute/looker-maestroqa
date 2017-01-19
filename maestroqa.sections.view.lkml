view: sections {
  sql_table_name: maestro.sections ;;

  dimension: section_id {
    description: "Identifier of this section of the rubric template"
    primary_key: yes
    type: string
    sql: ${TABLE}.section_id ;;
  }

  dimension: section_index {
    description: "Index of this section within its template"
    hidden: yes
    type: number
    sql: ${TABLE}.section_index ;;
  }

  dimension: name {
    description: "Name of this section"
    type: string
    sql: ${TABLE}.name ;;
  }


  dimension: default_answer {
    description: "If not NULL, is either 'na' or 'max', specifying how to pre-fill answers for this section"
    type: string
    sql: ${TABLE}.default_answer ;;
  }

  dimension: is_auto_fail {
    description: "Whether or not this is an autofail section"
    type: yesno
    sql: ${TABLE}.is_auto_fail ;;
  }

  dimension: is_bonus {
    description: "Whether or not this is a bonus section"
    type: yesno
    sql: ${TABLE}.is_bonus ;;
  }

  dimension: template_id {
    description: "Identifier of the template this section belongs to "
    type: string
    # hidden: yes
    sql: ${TABLE}.template_id ;;
  }

  dimension: weight {
    description: "Weight of this section"
    type: number
    sql: ${TABLE}.weight ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      section_id,
      templates.name,
      templates.template_id,
      options.count,
      questions.count,
      section_scores.count
    ]
  }
}
