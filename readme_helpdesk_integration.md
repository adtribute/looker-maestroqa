LOOKER.COM FORMATS THIS DOCUMENT WEIRDLY.
PLEASE REFER TO THE [GITHUB VERSION](https://github.com/adtribute/looker-maestroqa/blob/master/helpdesk_integration.md) FOR CLEANER FORMATTING.

# README: Helpdesk Integration

This document details how one might merge an existing Looker Block with helpdesk data into this block, and how to build explores and dashboard elements with both MaestroQA and helpdesk data.

*Note: adhering to the instructions in this document is optional and it's entirely possible to receive gainful analytics insights with just the MaestroQA data.*


## Getting started
If you're reading this, let's assume that you've already set up an integration between your Looker instance and MaestroQA. If this isn't the case, pop over [here](https://app.maestroqa.com/settings/integrations/looker) and get that set up. Next you'll want to ensure that you've set up an integration with whichever helpdesk you use (be it Desk.com, Zendesk, Freshdesk, Salesforce, etc.) to push helpdesk data to the **same Looker connection** that the MaestroQA<-->Looker integration uses **and** uses the new LookML. Here at Maestro, we don't set up these helpdesk<-->Looker integrations ourselves, but there are [plenty](https://www.fivetran.com/) [of](https://www.xplenty.com/) [services](https://www.stitchdata.com/) that can do just that.

So at this point you should have a MaestroQA Looker project and a Helpdesk Looker project on the same connection. The end goal here is to have a project that contains all the views and models from _both_ projects, and an extra model that contains the Explores that combine the data from the two sources. Itemized, there are three goals here:
1) Get Views from both projects into one project, with appropriate namespacing
2) Get the Models from each project into a single project and ensure they can `include` their respective views and build an explore that uses views from both projects
3) Build a dashboard with elements that can use data from the pure-MaestroQA Model, pure-Helpdesk Model, or the hybrid Model.

This will be pretty straightforward, but will require some manual modification of files, as Looker doesn't support the project-merging we want to do out of the box.

## Merging Projects Locally
You'll need to pick one of your existing projects to become the MaestroQA/Helpdesk hybrid project. You could create a new project for this task, but we recommend that you just augment the MaestroQA-only project. This is most easily done locally via the terminal.

Let's start by cloning the github repositories for both the MaestroQA and Helpdesk Looker Projects onto your machine. Find the clone URL (using either SSH or HTTPS) and [clone these onto some local directory](https://help.github.com/articles/cloning-a-repository/).
```
$ git clone https://github.com/my_github_account/maestroqa-looker-block.git
$ git clone https://github.com/my_github_account/helpdesk-looker-block.git
```
Next let's copy all of the `helpdesk-looker-block` lookML files into the `maestroqa-looker-block`. In the shell, from the directory that contains both `helpdesk-looker-block` and `maestroqa-looker-block`, execute the following commands*:
```
$ for f in <helpdesk-looker-block>/*.lkml;
    do cp $f "<maestroqa-looker-block>/<helpdesk>.${f##*/}";
    done
```
_*You'll want to replace the strings `<helpdesk-looker-block>`, `<maestroqa-looker-block>` and `<helpdesk>` with the helpdesk block directory, maestroQA block directory and the name of your helpdesk respectively._

This effectively renames all your helpdesk lookML files to be prefixed with the string `<helpdesk>` to help keep the namespace clean. Next you'll want to ensure that each of your `.model.lookml` files have the correct imports. See the subsection "Clever View File Naming Patterns Can Be Helpful" [here](https://looker.com/docs/reference/model-params/include) for more information on how `includes` works, but you'll want to switch all lines of the form
```
include "*.view" # imports ALL views
include "*.dashboard" # imports ALL dashboards
```
to
```
include "<helpdesk>.*.view" # imports just HELPDESK views
include "<helpdesk>.*.dashboard" # imports just HELPDESK dashboards
```

If you've followed these steps correctly, go ahead and commit your changes to the `maestroqa` repo and pull these changes on your Looker instance and validate that the LookML is valid.

## Building a hybrid model/dashobard
Now all that's left is building out the Model that uses both Helpdesk and MaestroQA data. On your Looker instance, examine the Model titled `maestroqa_helpdesk_hybrid`. This gives an example of how you can fold in your MaestroQA models and Helpdesk Models and build explores using views from each of the now-merged projects. You'll want to explicitly list the models that get included, but you don't need to include any views (if they're already included by the models):
```
include: "maestroqa.model.lkml"
include: "<helpdesk>.model.lkml"
```
This allows you to reference the explores from each included model directly (assuming no namespace collisions), as well as create explores from views included by each of the two models in two different ways. You can extend an existing explore and fold new joins directly into it:
```
explore:  answers_ticket_extend { # Extends usage example
  extends: [rubric_answers]
  join: zendesk_tickets {
    from: zendesk_tickets
    relationship: many_to_one
    sql_on: ${answers.gradable_id} = ${zendesk_tickets.id} ;;
 }
}
```
Note that you will not be able to see this Explore in the Explores tab of your looker instance, but you can still use it as the source of an element within your dashboard. Alternatively you can define the entire Explore explicitly like so
```
explore: answers_ticket_scratch {
  from: answers
  join: zendesk_tickets {
    from: zendesk_tickets
    relationship: many_to_one
    sql_on: ${answers_ticket_scratch.gradable_id} = ${zendesk_tickets.id} ;;
  }
}
```
Regardless of the source of the explore, you'll be able to use it as the source of an element within your dashboard. At this stage, you  should be all set to build out whichever metrics/dashboard elements you desire! Happy exploring!

Lastly, if you run into any problems, shoot [team@maestroqa.com](mailto:team@maestroqa.com) an email and we'd love to help you get things set up.
