class RoomsController < ApplicationController
  def new
    @room = Room.new
  end
  # 新規チャットルーム作成時にデータを格納するroomインスタンスを生成

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end
  # newで@roomというインスタンスを生成→
  # チャットルーム作成画面でデータが格納された@roomがcreateアクションに送られてくるが、
  # テーブルに保存する前にセキュリティ対策としてストロングパラメーターを使い許可するパラメーターを指定してからデータを保存するよう推奨されているのでprivate以下で許可
  # DBに保存が成功したらルートパスへ遷移、失敗したら新規チャットルーム作成画面へ遷移


  private
  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
  # roomという配列のキーnameとuser_idsのバリューを許可
  # user_idsの中身はさらに配列になっているので[]が必要
end
