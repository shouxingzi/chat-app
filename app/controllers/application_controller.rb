# 全てのコントローラーが継承するファイル
# deviseのコントローラーはここに記述する。なぜならば、deviseのコントローラーはGem内に記述されているため編集ができないから

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # authenticate_user!
  # ログイン状態によって表示するページを切り替えるdeviseのメソッド。処理が呼ばれた段階でユーザーがログインしていなければ、そのユーザーをログイン画面に遷移させる。
  # before_actionで呼び出すことでアクションを実行する前にログインしていなければログイン画面に遷移させられる。
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  # deviseに関するコントローラーの処理のみ、実行される前にconfigure_permitted_parameterが実行される

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # sign_up(新規登録の処理)に対して、name というキーのパラメーターを新たに許可
  end
end

# devise_parameter_sanitizer メソッドはdeviseでユーザー登録する場合に使用でき、特定のカラムを許容するメソッド
# nameカラムは既存のカラムに対して独自で追加したカラムなのでこのメソッドを使う
# 第一引数の処理名 sign_up は新規登録の処理を行うとき、sign_in はログインの処理を行う時、account_updateはアカウント情報更新の処理を行うときに用いられる。
