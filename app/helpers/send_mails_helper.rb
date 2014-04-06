module SendMailsHelper
  def send_email_list
    if session[:user_ids]
      emails = []
      session[:user_ids].each do |id_hash|
        bcard = BusinessCard.find_by_id(id_hash.values[0])
        if bcard.try("email").present?
          emails << bcard.try("name") + "(" + bcard.try("email") + ")"
        end
      end
      return raw emails.compact.join("<br>")
    end
  end
end
