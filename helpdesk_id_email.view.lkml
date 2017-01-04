view: helpdesk_id_email {
  sql_table_name: maestro.helpdesk_id_email ;;

  dimension: email {
    description: "Email address of this helpdesk agent"
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: helpdesk_id {
    description: "Zendesk/Freshdesk/Desk.com agent ID number"
    type: number
    sql: ${TABLE}.helpdesk_id ;;
  }

  dimension: id_type {
    description: "Type of id the helpdesk_id is. Can be zd_user_id, fd_user_id, desk_user_id for zendesk, freshdesk, desk agents respectively"
    type: string
    sql: ${TABLE}.id_type ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
