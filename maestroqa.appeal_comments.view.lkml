view: appeal_comments {
  sql_table_name: maestro.appeal_comments ;;

  dimension: appeal_id {
    description: "ID of the appeal this comment is part of"
    type: string
    sql: ${TABLE}.appeal_id ;;
  }

  dimension: comment_index {
    description: "The index of this comment in its corresponding appeal"
    type: number
    sql: ${TABLE}.comment_index ;;
  }

  dimension: author_email {
    description: "Email address of the author of this comment"
    type: string
    sql: ${TABLE}.author_email ;;
  }

  dimension_group: created {
    description: "UTC time this appeal was created"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at ;;
  }

  dimension: appeal_comment {
    description: "The comment that was written on the appeal"
    type: string
    sql: ${TABLE}.appeal_comment ;;
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
