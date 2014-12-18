do (String) ->
  String.prototype.contains = (str) -> @indexOf(str) > -1

do (window) ->

  findInput = (element) ->
    inputs = element.getElementsByClassName 'input'
    if inputs.length > 0
      inputs[0]
    else
      inputs = element.getElementsByTagName 'input'
      if inputs.length > 0
        (return input if input.getAttribute('type') is 'password') for input in inputs
        inputs[0]

  findWidget = (element) ->
    inputs = element.getElementsByClassName 'widget'
    if inputs.length > 0
      inputs[0]
    else
      inputs = element.getElementsByTagName 'i'
      if inputs.length > 0
        inputs[0]


  class VisiblePasswordInput
    constructor: (@options) ->
      @options ||= {}
      @element = @options.element
      throw "No element provided" unless @element
      @generateDOM()
      @addClasses()
      @addInputAttributes()
      @initialize()

    generateDOM: () ->
      @input = findInput(@element) || document.createElement('input')
      @input.setAttribute 'type', 'password'
      @widget = findWidget(@element) || document.createElement('i')

      @element.appendChild @input
      @element.appendChild @widget

    addClasses: () ->
      # Set widget classes
      @widget.className += ' widget ' unless @input.className.contains 'widget'
      if Array.isArray @options.widget?.class
        @widget.className += @options.widget?.class.join(' ') || ''
      else
        @widget.className += @options.widget?.class || ''

      # Set input classes
      @input.className += ' input ' unless @input.className.contains 'input'
      if Array.isArray @options.input?.class
        @input.className += @options.input?.class.join(' ') || ''
      else
        @input.className += @options.input?.class || ''

      # Set element classes
      @element.className += ' visible-password' unless @element.className.contains 'visible-password'

    addInputAttributes: () ->
      @input.setAttribute attr, @options.input.attrs[attr] for attr in Object.keys(@options.input?.attrs || {})

    revealPassword: () => @input.setAttribute 'type', 'text'

    hidePassword: () => @input.setAttribute 'type', 'password'

    initialize: () ->
      @widget.onmousedown = @revealPassword
      @widget.onmouseup = @hidePassword

  window.VisiblePasswordInput = VisiblePasswordInput

do () ->
  items = document.getElementsByClassName 'visible-password'
  new VisiblePasswordInput({element: item}) for item in items