do (String) ->
  String.prototype.contains = (str) -> @indexOf(str) > -1

do (window) ->
  class VisiblePasswordInput
    constructor: (@options) ->
      @element = @options.element
      throw "No element provided" unless @element
      @generateDOM()
      @addClasses()
      @initialize()

    generateDOM: () ->
      @input = document.createElement 'input'
      @input.setAttribute 'type', 'password'
      @widget = document.createElement 'i'
      @element.appendChild @input
      @element.appendChild @widget

    addClasses: () ->
      @widget.className = 'widget'
      @input.className = 'input'
      @element.className += ' visible-password' unless @element.className.contains 'visible-password'

    revealPassword: () => @input.setAttribute 'type', 'text'

    hidePassword: () => @input.setAttribute 'type', 'password'

    initialize: () ->
      @widget.onmousedown = @revealPassword
      @widget.onmouseup = @hidePassword

  window.VisiblePasswordInput = VisiblePasswordInput

do () ->
  items = document.getElementsByClassName 'visible-password'
  new VisiblePasswordInput({element: item}) for item in items