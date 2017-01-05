connection: "staging_postgres" # or whatever connection you

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: templates {
  label: "Rubric Templates"
  view_name: templates
  from: templates
  join: sections {
    type: left_outer
    relationship: one_to_many
    sql_on:  ${templates.template_id} = ${sections.template_id} ;;
  }
  join: questions {
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

explore: answers {
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

  ## QUESTION_SCORES + QUESTIONS (questions only needed for question metadata)
  join: question_scores {
    type: left_outer
    relationship: one_to_many
    sql_on: ${answers.answer_id} = ${question_scores.answer_id} ;;
  }
  join: questions {
    type:  left_outer
    relationship: one_to_many
    sql_on: ${question_scores.template_id} = ${questions.template_id} and
            ${question_scores.question_id} = ${questions.question_id};;
    fields: [question, description, score_min, score_max, score_system]
  }
  join: options {
    type: left_outer
    relationship: one_to_many
    sql_on: ${questions.template_id} = ${options.template_id} and
            ${questions.section_id} = ${options.section_id} and
            ${question_scores.option_id} = ${options.option_id};;
  }

  ## HELPDESK ID EMAIL TO MAP GRADEE ID TO EMAIL
  join: helpdesk_id_email {
    type: left_outer
    relationship: one_to_one
    sql_on: ${answers.gradee_id} = ${helpdesk_id_email.helpdesk_id};;
    fields: [email]
  }


  }
