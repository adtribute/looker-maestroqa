view: user_groups {
  sql_table_name: maestro.user_groups ;;

  dimension: agent_id {
    type: number
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

  measure: count {
    type: count
    drill_fields: [group_name]
  }
}
