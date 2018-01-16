view: user_groups {
  sql_table_name: maestro.user_groups ;;

  dimension: agent_id {
    type: string
    description: "Identifier of this agent"
    sql: ${TABLE}.agent_id ;;
  }

  dimension: group_id {
    type: string
    description: "Identifier of this group"
    sql: ${TABLE}.group_id ;;
  }

  dimension: group_name {
    type: string
    description: "Name of this group"
    sql: ${TABLE}.group_name ;;
  }

  dimension: row_updated_at {
    description: "UTC time this row was last updated"
    type: time
    sql: ${TABLE}.row_updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [group_name]
  }
}
