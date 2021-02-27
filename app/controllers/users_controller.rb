# usersコントローラー
class UsersController < ApplicationController

  def edit #ユーザー編集用のビューを表示
  end

  def update #更新
    # 更新が成功したらルートパス（チャット画面）へ遷移。失敗したらedit（ユーザー編集用のビュー）へ遷移
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  # current_userメソッドはdevise専用メソッド。現在ログインしているユーザーのレコードが取得され格納されている。
  # user_paramsはストロングパラメータのメソッド。private以下で定義されている
  # 現在ログインしているユーザーの情報をuser_paramsの情報に更新
  # redirect_toメソッドはページを切り替えるメソッド
   # ルーティング→コントローラー→ビューという経緯をたどる。
  # renderメソッドはビューファイルを指定するメソッド。
   # ルーティングやコントローラーを経由せずに直で指定のビューに遷移。
   # redirectとの違いは元のインスタンス変数の値が上書きされるかされないか。renderは上書きされない(?)フォームに入力した内容を保持したままユーザー編集画面に戻る

  
  
  private #private以下のメソッドはクラス外から呼び出すことができない

  def user_params
    params.require(:user).permit(:name, :email)
  end
  # ストロングパラメーターでuser_paramsを定義
  # フォームから受信したuserモデルのnameとemailの編集を許可

end
