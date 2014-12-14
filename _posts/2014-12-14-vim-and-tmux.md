---
title: Web Development with Vim and Tmux
layout: post
---

Over the course of the last 4 months, I've transitioned from using Atom as my every-day development tool to becoming a pretty hard-core fan of [Vim](http://www.vim.org/). While the learning curve is steep at the beginning, the ability to customize every aspect of the editor and the amazing plugin community are the things that really drew me in.  However, the real deal breaking for me was using it in conjunction with [Tmux](http://tmux.sourceforge.net/), allowing me to keep every part of my development flow contained within one application ([iTerm 2](http://iterm2.com/)).  This post will largely go over how I have everything set up and why I think Vim and Tmux make for the best possible development workflow.

## Vim

If you're not familiar with Vim, it is an extremely powerful text editor that has actually been around since the early 1990s.  Despite its age, it's considered one of the most effective editors because of its amazing keyboard shortcuts, which allow you to do things like navigating your documents, copy-and-pasting code, and reformatting large swaths of text without ever having to take your hands off the keyboard.  And, because everything in Vim is easily reconfigurable, you can adjust Vim's settings to match exactly what feels most natural to you.

## Tmux

Tmux, short for "Terminal Multiplexer", allows you to run multiple terminal sessions within a single open application, letting you jump between them easily with keyboad shortcuts.  This allows you to have mutliple tabs (called a `window` in Tmux parlance) open simultaneously, each divided into multiple `panes`, which you can view simultaneously.  What's neat about this is that it allows you to have Vim open right next to your development server (or test suite, or whatever you're working on), and you're just a quick keyboard shortcut away from moving from one to the other.


<a href="http://cl.ly/Yxch/Screen%20Shot%202014-12-14%20at%2012.57.37%20PM.png">
  ![Terminal Screenshot](http://cl.ly/Yxch/Screen%20Shot%202014-12-14%20at%2012.57.37%20PM.png)
</a>

