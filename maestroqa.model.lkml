# # This explore is intended to be JUST the MaestroQA generated data
# # For integration with a helpdesk block, see the documentation titled
# # 'helpdesk_integration' (warning: some dev experience probably required)


connection: "your_connection_here" # Replace with your connection name

# include all the views that maestroqa uses
include: "maestroqa.*.view"

# DON'T INCLUDE ANY DASHBOARDS HERE
# ALL DASHBOARDS ARE INCLUDED IN THE maestroqa_helpdesk_hybrid


explore: templates {
  label: "Rubric Templates"
  view_name: templates
  from: templates
  join: sections {
    from: sections
    type: left_outer
    relationship: one_to_many
    sql_on:  ${templates.template_id} = ${sections.template_id} ;;
  }
  join: questions {
    from:  questions
    type:  left_outer
    relationship: one_to_many
    sql_on:  ${templates.template_id} = ${questions.template_id} and
             ${sections.section_id} = ${questions.section_id};;

  }
  join: options {
    type: left_outer
    relationship: one_to_many
    sql_on: ${templates.template_id} = ${options.template_id} and
            ${sections.section_id} = ${options.section_id} and
            ${questions.question_id} = ${options.question_id};;
  }
  join: answers {
    type: left_outer
    relationship: one_to_many
    sql_on: ${templates.template_id} = ${answers.template_id} ;;
  }

}

explore: rubric_answers {
  label: "Rubric Answers"
  view_name: answers
  from:  answers
  join: templates {
    type: left_outer
    relationship: many_to_one
    sql_on: ${answers.template_id} = ${templates.template_id} ;;
  }

  ## SECTION_SCORES + SECTIONS (sections only needed for section metadata)
  join: section_scores {
    type: left_outer
    relationship: one_to_many
    sql_on: ${answers.answer_id} = ${section_scores.answer_id} ;;
  }
  join: sections {
    type: left_outer
    relationship: one_to_many
    sql_on: ${section_scores.template_id} = ${sections.template_id} and
            ${section_scores.section_id} = ${sections.section_id};;
    fields: [name, weight, is_auto_fail, is_bonus]
  }

  join: questions {
    type:  left_outer
    relationship: one_to_many
    sql_on: ${answers.template_id} = ${questions.template_id} and
            ${sections.section_id} = ${questions.section_id} ;;
    fields: [question, description, score_min, score_max, score_system]
  }

  join: question_scores {
    type: left_outer
    relationship: one_to_many
    sql_on: ${answers.answer_id} = ${question_scores.answer_id} and
            ${questions.template_id} = ${question_scores.template_id} and
            ${questions.question_id} = ${question_scores.question_id};;
  }

  join: options {
    type: left_outer
    relationship: one_to_many
    sql_on: ${questions.template_id} = ${options.template_id} and
            ${questions.section_id} = ${options.section_id} and
            ${question_scores.question_id} = ${options.question_id} and
            ${question_scores.option_id} = ${options.option_id};;
  }

  ## HELPDESK ID EMAIL TO MAP GRADEE ID TO EMAIL
  join: helpdesk_id_email {
    type: left_outer
    relationship: one_to_one
    sql_on: ${answers.gradee_id} = ${helpdesk_id_email.helpdesk_id};;
    fields: [email]
  }

  ## GROUP NAME TO MAP GRADEE ID TO GROUP
  join: user_groups {
    type: left_outer
    relationship: one_to_one
    sql_on: ${answers.gradee_id} = ${user_groups.agent_id};;
    fields: [group_name]
  }

  }
