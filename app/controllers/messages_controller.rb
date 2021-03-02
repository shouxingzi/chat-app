class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
  end
  # @messageにはMessage.newで生成したMessageモデルのインスタンス情報を代入している
  # @roomにはparamsに含まれているroom_idを代入している。

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      render :indes
    end
  end

  private
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
  #

end


