class SessionsController < Devise::SessionsController
  def after_sign_out_path_for(resource)
    "/"
  end
end
