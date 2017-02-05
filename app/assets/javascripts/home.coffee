# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

(($) ->
  skel.breakpoints
    xlarge: '(max-width: 1680px)'
    large: '(max-width: 1280px)'
    medium: '(max-width: 980px)'
    small: '(max-width: 736px)'
    xsmall: '(max-width: 480px)'
  $ ->
    $window = $(window)
    $body = $('body')
    $menu = $('#menu')
    $sidebar = $('#sidebar')
    $main = $('#main')
    # Disable animations/transitions until the page has loaded.
    $body.addClass 'is-loading'
    $window.on 'load', ->
      window.setTimeout (->
        $body.removeClass 'is-loading'
        return
      ), 100
      return
    # Fix: Placeholder polyfill.
    $('form').placeholder()
    # Prioritize "important" elements on medium.
    skel.on '+medium -medium', ->
      $.prioritize '.important\\28 medium\\29', skel.breakpoint('medium').active
      return
    # IE<=9: Reverse order of main and sidebar.
    if skel.vars.IEVersion <= 9
      $main.insertAfter $sidebar
    # Menu.
    $menu.appendTo($body).panel
      delay: 500
      hideOnClick: true
      hideOnSwipe: true
      resetScroll: true
      resetForms: true
      side: 'right'
      target: $body
      visibleClass: 'is-menu-visible'
    # Search (header).
    $search = $('#search')
    $search_input = $search.find('input')
    $body.on 'click', '[href="#search"]', (event) ->
      event.preventDefault()
      # Not visible?
      if !$search.hasClass('visible')
        # Reset form.
        $search[0].reset()
        # Show.
        $search.addClass 'visible'
        # Focus input.
        $search_input.focus()
      return
    $search_input.on('keydown', (event) ->
      if event.keyCode == 27
        $search_input.blur()
      return
    ).on 'blur', ->
      window.setTimeout (->
        $search.removeClass 'visible'
        return
      ), 100
      return
    # Intro.
    $intro = $('#intro')
    # Move to main on <=large, back to sidebar on >large.
    skel.on('+large', ->
      $intro.prependTo $main
      return
    ).on '-large', ->
      $intro.prependTo $sidebar
      return
    return
  return
) jQuery
