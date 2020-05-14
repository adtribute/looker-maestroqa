view: helpdesk_id_email {
  sql_table_name: maestro.helpdesk_id_email ;;

  dimension: email {
    description: "Email address of this helpdesk agent"
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: agent_name {
    description: "Name of agent"
    type: string
    sql: ${TABLE}.agent_name ;;
  }

  dimension: agent_availability {
    type: yesno
    description: "Availability of this agent"
    sql: ${TABLE}.agent_availability ;;
  }

  dimension: helpdesk_id {
    description: "String cast Salesforce/Zendesk/Desk/Freshdesk  agent ID "
    type: string
    sql: ${TABLE}.helpdesk_id ;;
  }

  dimension: id_type {
    description: "Type of id the helpdesk_id is. Can be zd_user_id, fd_user_id, desk_user_id for zendesk, freshdesk, desk agents respectively"
    type: string
    sql: ${TABLE}.id_type ;;
  }

  dimension_group: row_updated {
    description: "UTC time this row was last updated"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.row_updated_at ;;
  }


  measure: count {
    type: count
    drill_fields: []
  }
}
