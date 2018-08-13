Shell = require 'shell'

module.exports =
  activate: ->
    atom.commands.add 'atom-workspace', '360search:360-it': => @search()

  search: ->
    editor = atom.workspace.getActiveTextEditor()
    buffer = editor.getBuffer()
    selections = editor.getSelections()

    buffer.transact ->
      for selection in selections
        cased = selection.getText()
        url = "https://www.360u.com/web?query=#{cased}"
        Shell.openExternal url
