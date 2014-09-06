---
title: Testing Socket.io with Jasmine
layout: page
excerpt: This is a test
---

# {{ page.title }}

For my most recent project, [Firehose Chat](http://firehosechat.com), I got to play with Web Sockets through [Socket.io](http://socket.io) and immediately fell in love.  I love the idea of an event based system that you can simply add callbacks to, and being able to implement something like this to enable real-time communication is fantastic.  However, like any piece of software, you need to be able to write tests to make sure that it works, and here I ran into a problem.

{% highlight coffeescript linenos %}
test = (data)->
  return data
{% endhighlight %}

To make sure that everything worked correctly, I realized that I needed to be able to fake Socket.io events to make sure my callbacks worked the way I want them to.  Since I do my JavaScript testing using [Jasmine](http://jasmine.github.io/2.0/introduction.html), I started digging into its ability to hijack method calls to tests asynchronous calls, but realized that that was going to be a lot more complicated to implement than I would have liked.  So instead, I started digging into the Socket.io library itself to get a handle on what my options were, and found that it's really simple to trigger the callbacks associated with an event!
