class BusinessCardsController < ApplicationController
  # GET /business_cards
  # GET /business_cards.json
  def index
    @business_card = BusinessCard.new
    @business_cards = BusinessCard.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /business_cards/1
  # GET /business_cards/1.json
  def show
    @business_card = BusinessCard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /business_cards/new
  # GET /business_cards/new.json
  def new
    @business_card = BusinessCard.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /business_cards/1/edit
  def edit
    @business_card = BusinessCard.find(params[:id])
  end

  # POST /business_cards
  # POST /business_cards.json
  def create
    @business_card = BusinessCard.new(params[:business_card])

    respond_to do |format|
      if @business_card.save
        format.html { redirect_to user_business_card_path(current_user.id, @business_card.id), notice: '名刺データを登録しました' }
        format.js {}
      else
        format.html { render action: "new" }
        format.js {render js: "alert('名刺データの登録に失敗しました。')"}
      end
    end
  end

  # PUT /business_cards/1
  # PUT /business_cards/1.json
  def update
    @business_card = BusinessCard.find(params[:id])

    respond_to do |format|
      date = params[:business_card][:meet_day] 
      params[:business_card][:meet_day] = date ? Date.parse(date) : nil
      if @business_card.update_attributes(params[:business_card])
        format.html { redirect_to user_business_card_path(current_user.id, params[:id]), notice: 'アップデートしました。' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /business_cards/1
  # DELETE /business_cards/1.json
  def destroy
    @business_card = BusinessCard.find(params[:id])
    @business_card.destroy

    respond_to do |format|
      format.html { redirect_to user_business_cards_url(current_user.id) }
      format.json { head :no_content }
    end
  end

  def mail_list
    session[:user_ids] = params[:business_cards]
    redirect_to new_user_send_mail_path(current_user)
  end
end
