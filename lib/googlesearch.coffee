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
        url = "https://www.so.com/s?q=#{cased}"
        Shell.openExternal url
