module SendMailsHelper
  def send_email_list
    if session[:user_ids]
      emails = []
      receivers = []
      session[:user_ids].each do |id_hash|
        bcard = BusinessCard.find_by_id(id_hash.values[0])
        if bcard.try("email").present?
          receivers << bcard.try("name") + "(" + bcard.try("email") + ")"
          emails << bcard.try("email")
        end
      end
      return [receivers.compact, emails.compact]
    end
  end
end
