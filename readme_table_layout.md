# README: Table Layout

This document briefly discusses the data models we use to store rubrics templates and their corresponding answers. Feel free to peruse the various views for more explicit DDL, but this should serve as a decent intro to the data that is exported by Maestro into Looker.

## Templates
A template is a rubric without any answers attached. Each template possesses a unique `template_id` which is used to refer to the template and all objects that it owns.

A complete template is separated into 4 different tables: **templates**, **sections** **questions**, and **options**. See entity relationship diagram below
![N|Solid](http://i.imgur.com/2CjTvgX.png)

Each template has several sections; each section has several questions; each question may or may not have several options (that is, some questions may have options, while others may not). Each entity has a level-specific identity field and each entity contains the id of all of its parent entities, e.g. an individual question will have a `(question_id, section_id, template_id)` triplet. While each individual `<entity>\_id` should be globally unique, it is preferred to always at least join on the `template_id`, as this is the distribution key for redshift tables.

## Answers
An answer is an application of a template to a ticket/case (tickets and cases are known as `gradables`). Answers must have a `(answer_id, template_id, gradable_id)` triplet. The `answer_id` is a globally unique identifier for a grading of a particular gradable by a particular template, but since it is expected that an answer can be joined to the helpdesk-specified `(ticket|case)_id`, data is distributed by the `gradable_id`. A single answer stores its information in three tables: **answers**, **section_scores**, and **question_scores**. See the entity relationship diagram below: ![N|Solid](http://i.imgur.com/SsyRUHZ.jpg)

Each answer can have several section scores, each of which contains score data aggregated over a particular section, and similarly each answer can have several question scores, which contain score data for a particular question. Note that question scores are not owned by section scores despite questions being owned by sections in the **templates** diagram. Similar to **templates** and its child tables, each child table contains all its parent identifiers (`(answer_id, template_id, gradable_id)` in this case) as well as level-specific identifiers: `section_id` and `question_id` for **section_scores** and **question_scores** respectively.

## Helpdesk ID/Emails
We also include a table to map helpdesk ids to emails for use in joins and visualizations into human-readable values. This is simply a map between the `(zendesk|desk|freshdesk)_id` and `email` for all relevant agents.


## User Groups
Finally we also include a table to map groups of agents to their respective agent ids for use in joins and visualizations. This is simply a map between `group_id/group_name` and `agent_id` for each agent that belongs to a group.
