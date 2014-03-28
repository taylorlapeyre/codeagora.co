$ ->
  $('.mark-as-read').click ->
    id = $(this).data('id')

    $.ajax
      type: 'PATCH'
      url: "/notifications/#{id}"
      data: {notification: {unread: false}}
      success: (data) =>
        $(this).parents('.notification').fadeOut(200)
