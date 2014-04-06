class RegistrationsController < Devise::RegistrationsController
  # deviseのオーバーライド
  def create
    build_resource(sign_up_params)
    resource_saved = resource.valid?
    if resource_saved
      super
    else
      clean_up_passwords resource
      redirect_to "/", alert: resource.errors.full_messages.join("<br>").html_safe
    end
  end
end
