class Users::RegistrationsController < Devise::RegistrationsController #deviseの該当クラスを継承させる

  def create
    super do                                             # 他はdeviseの機能をそのまま流用する
      resource.update(confirmed_at: Time .now.utc)       # Welcomeメールを送信した上で、skip_confirmation!と同一処理を行い自動で認証クローズさせる
    end
  end

  def update_resource(resource, params)
    if params[:password].present? || params[:password_confirmation].present?
      super
    else
      params.except!(:current_password)
      resource.update_without_password(params)
    end
  end


  def after_update_path_for(_resource)
    users_dash_boards_path
  end
end
