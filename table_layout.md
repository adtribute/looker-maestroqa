# Table Layout

This document briefly discusses the data models we use to store rubrics templates and their corresponding answers.

## Templates
A template is a rubric without any answers attached. A template is identified by its unique template\_id and can have many sections. Each section is identified by a section\_id which is unique, but it is preferred to always refer to refer to a section by the (template\_id, section\_id) pair, particularly if you use a redshift instance as the template\_id is the DISTKEY. Each section can have many questions. Each equestion is identified by a unique question\_id, but again, it is preferred to refer to a question by the (template\_id, section\_id, question\_id) triple. If the question has score\_system of 'custom', it will have several options. Each option is identified by a unique option\_id.


## Answers
An answer is an application of a template to a ticket/case (tickets and cases are known as 'gradables'). Answers must have a template\_id, gradable\_id and gradee\_id. The template\_id corresponds to an existing template in the templates view, a gradable\_id is the ticket id or case id from your helpdesk and a gradee\_id is the helpdesk ID of the agent being graded. Like the templates themselves, answers have related tables for sections and questions. Each answer can have many section\_scores, one per section, and each is identified by an answer\_id, template\_id, and section\_id corresponding to the owning answer and the relevant (template, section). Each answer can also have many question\_scores, one per question, and each is identified by an answer\_id, template\_id and section\_id. Unlike the questions view, question\_scores does not have a reference to its owning section\_id, though one can easily be attained through a join on the questions table.
