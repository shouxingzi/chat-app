class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
  end
  # @messageにはMessage.newで生成したMessageモデルのインスタンス情報を代入している
  # @roomにはparamsに含まれているroom_idを代入している。
  # チャットルームに紐付いている全てのメッセージ(@room.messages)を@messageと定義。一覧画面で表示するメッセージ情報にはユーザー情報も紐付いて表示される
  # この場合メッセージに紐づくユーザー情報の取得に、メッセージの数と同じ回数のアクセスが必要になるが、includesメソッドでユーザー情報を一度のアクセスでまとめて取得している。


  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :indes
    end
  end

  private
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
  #

end


