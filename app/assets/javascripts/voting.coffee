$ ->
  $('.upvote').click ->
    id = $(this).data('id')
    $.ajax
      type: 'POST',
      url: '/votes',
      data: {snippet_id: id, type: 'upvote'}
      success: (data) =>
        $(".score[data-id='#{id}'").text(data.score)
        $(this).parents('.voting').find('.fa').removeClass('active')
        if data.status == 'upvoted'
          $(this).addClass('active')

  $('.downvote').click ->
    id = $(this).data('id')
    $.ajax
      type: 'POST',
      url: '/votes',
      data: {snippet_id: id, type: 'downvote'}
      success: (data) =>
        $(".score[data-id='#{id}'").text(data.score)
        $(this).parents('.voting').find('.fa').removeClass('active')
        if data.status == 'downvoted'
          $(this).addClass('active')
