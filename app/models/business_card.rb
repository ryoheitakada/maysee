class BusinessCard < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :meet_day, :place, :remarks, :tag
  default_scope order("id desc")

  scope :search_by_word, lambda{|word|
    sql = word.split(/ |　/).map do |w|
      "(last_name ilike ? OR first_name ilike ? OR place ilike ? OR tag ilike ? OR email ilike ?)"
    end.join(" AND ")
    args = word.split(/ |　/).map{|w| ["%#{w}%","%#{w}%","%#{w}%","%#{w}%","%#{w}%"] }.flatten
    where(sql, *args)
  }
  scope :search_by_date, lambda { |from, to|
    where("meet_day >= ? AND meet_day <= ?", from, to)
  }
  def name
    last_name + first_name
  end

  def tag_name
    return tag.present? ? tag.to_s.split(/,| |　/).join(",") : "-"
  end

  def self.search_by_params(params)
    word = params[:business_card][:word].to_s
    from = params[:business_card][:from].present? ? Date.parse(params[:business_card][:from]) : Date.new(1000)
    to = params[:business_card][:to].present? ? Date.parse(params[:business_card][:to]) : Date.new(3000)
    return self.search_by_word(word).search_by_date(from, to)
  end
end
