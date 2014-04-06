class SendMailsController < ApplicationController
  include SendMailsHelper
  before_filter :authenticate_user!
  before_filter :block_other_user
  def new
    @send_mail = @send_mail || SendMail.new
  end

  def create
    @send_mail = current_user.send_mails.build(params[:send_mail])
    @send_mail.emails = send_email_list[1].join(",")
    if @send_mail.save
      success_addr = []
      error_addr = []
      @send_mail.emails.split(",").each do |email|
        if SendMail.send_mail(email, @send_mail, current_user)
          success_addr << email
        else
          error_addr << email
        end
      end
      if success_addr.present?
        flash[:notice] = success_addr.join(",") + "にメールを送信できました。"
      end
      if error_addr.present?
        flash[:alert] = error_addr.join(",") + "にメールを送信できませんでした。"
      end
      redirect_to "/"
    else
      redirect_to "/", alert: "メールの送信に失敗しました。"
    end
  end
end
