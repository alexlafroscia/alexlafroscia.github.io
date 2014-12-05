---
---

$ ->
  $('.fa-bars').click (e)->
    e.preventDefault()
    $(e.target).toggleClass 'rotated'
    $('.topnav').toggleClass 'visible'
