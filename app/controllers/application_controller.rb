class ApplicationController < ActionController::Base
  protect_from_forgery
  def block_other_user
    if params[:user_id] && (params[:user_id].to_i != current_user.id)
      redirect_to user_business_cards_path(current_user.id), alert: "不正なアクセスです。"
    else
      return true
    end
  end
end
