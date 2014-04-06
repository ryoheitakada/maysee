class MsMailer < ActionMailer::Base
  default from: "info@maysee.com"

  def ms_mail(*args)
    @from = args[0]
    @to = args[1]
    @subject = args[2]
    @options = args[3]
    I18n.locale=:ja
    mail(to: @to, subject: @subject || "いつもお世話になっております。", from: @from || current_user.email) do |format|
      format.text { render layout: nil }
    end
  end
end
