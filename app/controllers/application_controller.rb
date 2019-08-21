class ApplicationController < ActionController::Base
   protected
   def configure_permitted_parameters
   	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
   end
  def after_sign_in_path_for(resource)
    user_path(resource) # ログイン後に遷移するpathを設定
  end
def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
   end
end

