---
---

$ ->
  $('.fa-bars').click (e)->
    e.preventDefault()
    $(e.target).toggleClass 'rotated'
