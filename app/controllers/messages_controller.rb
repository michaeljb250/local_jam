class MessagesController < ApplicationController
  # def show
  #   @chatroom = Chatroom.find(params[:id])
  #   @message = Message.new
  # end

  def create
    @group = Group.find(params[:group_id])
    @message = Message.new(message_params)
    @message.group = @group
    @message.user = current_user
    if @message.save
      redirect_to group_path(@group)
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
