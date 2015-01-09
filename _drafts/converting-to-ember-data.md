---
title: Making Progress: Moving to the CLI
layout: page
---

I recently started an internship with [Qualaris][], a SaaS company that's main product relies heavily on Ember.js.  Since I've been working with the Ember CLI with some other projects recently, my first task with them was to convert their existing app, based on the global variable structure that's existed since the very beginning of Ember, over to the CLI in preparation for the release of Ember 2.0.  Since the process was a little complicated, I figured I would lay out some of the motivations for the change, and go over a few things that I wish I had realized before getting started.


## Swing and a Miss: Ember CLI Migrator

One of the first things I tried was a project called the [Ember CLI Migrator](https://github.com/fivetanley/ember-cli-migrator), since I thought it might be able to at least get me started.  However, as much as I tried, it just didn't like the our files.  I tried running it on some of their example code, but for whatever reason I got errors any time I tried to run it on the actual project.  After almost an hour lost trying to make it work, I decided to just give up and do all of the conversions manually.


## Moving to the CLI

One of the challenges of this migration was preserving the Git history of the entire project while making some pretty extreme changes to the way the app as set up.  During a previous project conversion to the CLI, a major refactoring was needed too, so I rolled the change in project structure and refactoring together and just started over. creating a new repository altogether, initializing a new Ember app there, and the copy-and-pasting over whatever was useful and re-writing things where they could be done better.

## Get Moving

If you're working with Ember right now, there's a good chance that you're going to at least think about moving to the CLI in the near future.  For those interested in doing what they can to prepare their applications sooner rather than later, here's a few suggestions.

### Move away from global variables

The whole point of modules is to avoid global variables, and how the most part, the CLI makes it easy to convert a standard Ember app over without much of a hitch.  However, I found that the global `App` variable, because it was used in every piece of the application, had a lot of extra functionality tacked onto it. Utility methods, session information, functions used to transform data: `App` ended up housing almost anything.

Thankfully, the CLI nicely supports services, singleton objects that can be injected into any of the other parts of the application.  Because it's so easy to make services accessible throughout the application, much of what used to be attached to `App` got pulled into a service and then injected where it was needed.  While especially handy in the CLI, you can start moving logic into services even in non-CLI apps.  If you can get your own logic out of `App`, you'll save yourself a lot of time later when moving to the CLI.
