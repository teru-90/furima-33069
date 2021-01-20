class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
end

private

# メソッド名は慣習 deviseにおけるparamsのようなメソッド。新規に追加したカラムをdeviseが受け取れるようにする。
def configure_permitted_parameters
  # deviseのUserモデルにパラメーターを許可
  devise_parameter_sanitizer.permit(:sign_up,
                                    keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday])
end
