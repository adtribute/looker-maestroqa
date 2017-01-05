connection: "staging_postgres" # or whatever connection you

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: rubric_templates {
  label: "Rubric Templates"
  view_name: templates
  from: templates
  join: sections {
    type: left_outer
    relationship: one_to_many
    sql_on:  {templates.template_id} = ${sections.template_id} ;;
  }
}
