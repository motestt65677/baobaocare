class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(comment)
    ActionCable.server.broadcast "room_channel_#{comment.chatroom_id}", message:  render_message(comment)
  end

  private
  def render_message(comment)
    ApplicationController.renderer.render(partial: 'comments/comment', locals:{comment: comment})
  end
end
