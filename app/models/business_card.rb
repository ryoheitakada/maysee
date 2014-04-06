class BusinessCard < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :meet_day, :place, :remarks, :tag

  def name
    last_name + first_name
  end

  def tag_name
    return tag ? tag.to_s.split(/,| |　/).join(",") : "-"
  end
end
