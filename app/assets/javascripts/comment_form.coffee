$ ->
  $('.comment-submit').click (e) ->
    form = $(this).parents('.new-comment')
    content = form.find('.content').val()
    id = form.data('id')

    $.ajax
      url: '/comments'
      type: 'POST'
      data: {comment: {content: content, snippet_id: id}}
      success: ->
        form.html('Comment Posted.')
