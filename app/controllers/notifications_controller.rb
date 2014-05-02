class NotificationsController < ApplicationController
  before_filter :set_notification

  # Only used for marking a notification as `read`.
  def update
    if @notification.update notification_params
      head :ok
    else
      head :unprocessable_entity
    end
  end

  private
    def set_notification
      @notification = Notification.find(params[:id])

      unless signed_in? && current_user == @notification.user
        head :unauthorized
      end
    end

    def notification_params
      params.require(:notification).permit(:unread)
    end
end
