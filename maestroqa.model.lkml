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
    sql_on:  ${templates.template_id} = ${questions.template_id} ;;
  }
  join: options {
    type: left_outer
    relationship: one_to_many
    sql_on: ${templates.template_id} = ${options.template_id} ;;
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
  join: section_scores {
    type: left_outer
    relationship: one_to_many
    sql_on: ${answers.answer_id} = ${section_scores.section_id} ;;
  }
  join: question_scores {
    type: left_outer
    relationship: one_to_many
    sql_on: ${answers.answer_id} = ${question_scores.answer_id} ;;
  }
  join: helpdesk_id_email {
    type: left_outer
    relationship: one_to_one
    sql_on: ${answers.gradee_id} = ${helpdesk_id_email.helpdesk_id};;
  }
}


explore:  questions {
  label: "Questions"
  view_name: questions
  from: questions
  join: question_scores {
    type: left_outer
    relationship: one_to_many
    sql_on: ${questions.template_id} = ${question_scores.template_id} and ${questions.question_id} = ${question_scores.question_id};;
  }
  join: options {
    type: left_outer
    relationship: one_to_many
    sql_on: ${questions.template_id} = ${options.template_id} and
            ${questions.section_id} = ${options.section_id} and
            ${questions.question_id} = ${options.question_id};;
  }

}

explore: question_scores {
  label: "Question scores"
  view_name: question_scores
  from:  question_scores
}
