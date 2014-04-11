class CommentsMailer < ActionMailer::Base
  default from: "notifications@codeagora.co"

  def comment_notification_email(comment)
    @comment = comment
    mail({
      to: comment.snippet.user.email,
      subject: "New Comment on @#{comment.snippet.name}"
    })
  end

  def discussion_email(comment)
    @comment = comment
    mail({
      to: comment.snippet.user.email,
      subject: "New Response on @#{comment.snippet.name}"
    })
  end
end
