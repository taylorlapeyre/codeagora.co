window.editor =
  editor: null
  aliases: {
    'Bash': 'sh'
    'C++': 'c_cpp'
    'C': 'c_cpp'
    'Assembly': 'assembly_x86'
    'Coffeescript': 'coffee'
  }
  init: (e = null, t = null, m = null) ->
    e = '#editor_textarea' if e is null
    t = 'chrome' if t is null
    m = 'javascript' if m is null
    $(e).acedInitTA({theme: t, mode: m})
    this.editor = $($(e).data('ace-div')).aced();
  init_on_select: (s) ->
    this.init()
    this.highlight($(s).find("option:selected").text())
    this.highlight_on_select(s)
  init_check: () ->
    this.init() if this.editor is null
  get_editor: () ->
    this.init_check()
    this.editor
  theme: (t) ->
    this.get_editor().setTheme("ace/theme/" + t);
  highlight: (m) ->
    this.init_check()
    if m of this.aliases then m = this.aliases[m] else m = m.toLowerCase()
    this.get_editor().getSession().setMode('ace/mode/' + m)
  highlight_on_select: (s) ->
    $(s).change( () ->
      window.editor.highlight($(this).find("option:selected").text())
    )
  