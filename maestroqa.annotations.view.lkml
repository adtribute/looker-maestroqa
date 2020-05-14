view: annotations {
  sql_table_name: maestro.annotations ;;

  dimension: annotation_id {
    description: "Unique identifier for this annotation"
    primary_key: yes
    type: string
    sql: ${TABLE}.annotation_id ;;
  }

  dimension: answer_id {
    description: "ID of the answer this annotation is part of"
    type: string
    sql: ${TABLE}.answer_id ;;
  }

  dimension: template_id {
    description: "ID of the rubric used for this annotation"
    type: string
    sql: ${TABLE}.template_id ;;
  }

  dimension: section_id {
    description: "ID of the section containing this annotation"
    type: string
    sql: ${TABLE}.section_id ;;
  }

  dimension: question_id {
    description: "ID of the question containing this annotation"
    type: string
    sql: ${TABLE}.question_id ;;
  }

  dimension: is_general_comment {
    description: "If this annotation is a general comment not associated with a question"
    type: yesno
    sql: ${TABLE}.is_general_comment ;;
  }

  dimension: gradee_id {
    description: "String-cast helpdesk agent ID of the agent being graded"
    type: string
    sql: ${TABLE}.gradee_id ;;
  }

  dimension: grader_email {
    description: "Email address of the user doing the grading"
    type: string
    sql: ${TABLE}.grader_email ;;
  }

  dimension: annotation_type {
    # values are constrained to 'text', 'audio'
    description: "What type of annotation this is"
    type: string
    sql: ${TABLE}.annotation_type ;;
  }

  dimension: start_word {
    description: "The first word of the highlight"
    type: string
    sql: ${TABLE}.start_word ;;
  }

  dimension: end_word {
    description: "The last word of the highlight"
    type: string
    sql: ${TABLE}.end_word ;;
  }

  dimension: start_occurrence {
    description: "The index of the occurrence of the start_word in the agent's interaction"
    type: number
    sql: ${TABLE}.start_occurrence ;;
  }

  dimension: end_occurrence {
    description: "The index of the occurrence of the end_word in the agent's interaction"
    type: number
    sql: ${TABLE}.end_occurrence ;;
  }

  dimension: recording_timestamp {
    description: "The time in seconds of the start of the audio highlight"
    type: number
    sql: ${TABLE}.recording_timestamp ;;
  }

  dimension_group: created {
    description: "UTC time this annotation was created"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: updated {
    description: "UTC time this annotation was last updated"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: highlight {
    description: "The portion of the agent's interaction selected by the grader"
    type: string
    sql: ${TABLE}.highlight ;;
  }

  dimension: feedback {
    description: "The grader's comments for the agent about the highlight, if any"
    type: string
    sql: ${TABLE}.feedback ;;
  }

  dimension: is_deleted {
    description: "Whether or not this annotation has been deleted"
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension_group: row_updated {
    description: "UTC time time row was last updated"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.row_updated_at ;;
  }

  measure: count {
    type: count
  }

}
