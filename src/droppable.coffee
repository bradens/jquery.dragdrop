#
# Name      : jQuery DragDrop Droppable
# Author    : Steven Luscher, https://twitter.com/steveluscher
# Version   : 0.0.1-dev
# Repo      : https://github.com/steveluscher/jquery.dragdrop
# Donations : http://lakefieldmusic.com
#

jQuery ->

  $.droppable = class

    #
    # Config
    #

    defaults:
      # Applied when the droppable is initialized
      droppableClass: 'ui-droppable'

      # Applied when a draggable is hovering over this droppable
      hoverClass: 'ui-droppable-hovered'

    # Memoize the config
    getConfig: -> @config ||= jQuery.dragdrop.applyDefaults @options, @defaults

    #
    # Initialization
    #

    constructor: (element, @options = {}) ->
      # jQuery version of DOM element attached to the plugin
      @$element = $ element

      @$element
        # Mark this element as droppable with a class
        .addClass(@getConfig().droppableClass)

      # Make the plugin chainable
      this

  $.fn.droppable = (options) ->
    this.each ->
      unless $(this).data('droppable')?
        plugin = new $.droppable(this, options)
        $(this).data('droppable', plugin)