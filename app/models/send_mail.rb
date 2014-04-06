class SendMail < ActiveRecord::Base
  attr_accessible :emails, :title, :body

  def self.send_mail(email, instance, user)
    begin
      body = self.trans_body(instance.body, email)
      title = self.trans_title(instance.title, email)
      MsMailer.ms_mail(user.email, email, title, {body: body}).deliver
      return true
    rescue
      return false
    end
  end

  def self.trans_body(body, email)
    begin
      result = body.dup
      I18n.t("activerecord.attributes.business_card").each do |key, value|
        if BusinessCard.find_by_email(email).try(key)
          str = key == :meet_day ? BusinessCard.find_by_email(email).try(key).strftime("%-m月%-d日") : BusinessCard.find_by_email(email).try(key)
          result.gsub!(/\#\{#{value}\}/, str)
        end
      end
      return result
    rescue => e
      p e.inspect
      return raise
    end
  end

  def self.trans_title(title, email)
    begin
      result = title.dup
      I18n.t("activerecord.attributes.business_card").each do |key, value|
        if BusinessCard.find_by_email(email).try(key)
          str = key == :meet_day ? BusinessCard.find_by_email(email).try(key).strftime("%-m月%-d日") : BusinessCard.find_by_email(email).try(key)
          result.gsub!(/\#\{#{value}\}/, str)
        end
      end
      return result
    rescue => e
      p e.inspect
      return raise
    end
  end
end
