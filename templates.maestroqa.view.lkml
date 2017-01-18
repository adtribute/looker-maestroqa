view: templates {
  sql_table_name: maestro.templates ;;

  dimension: template_id {
    description: "Unique identifier for this template"
    primary_key: yes
    type: string
    sql: ${TABLE}.template_id ;;
  }

  dimension_group: created {
    description: "UTC time that this template was created"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at ;;
  }

  dimension: is_active {
    description: "Whether or not this template is active"
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: is_bonus_weighted {
    description: "Whether or not scores are weighted for bonus sections"
    type: yesno
    sql: ${TABLE}.is_bonus_weighted ;;
  }

  dimension: is_weighted {
    description: "Whether or not scores are weighted for non-bonus sections"
    type: yesno
    sql: ${TABLE}.is_weighted ;;
  }

  dimension: name {
    description: "The name of this template"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension_group: updated {
    description: "UTC time of when this template was last updated"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      template_id,
      name,
      answers.count,
      options.count,
      questions.count,
      question_scores.count,
      sections.count,
      section_scores.count
    ]
  }
}
