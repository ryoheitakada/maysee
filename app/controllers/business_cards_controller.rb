class BusinessCardsController < ApplicationController
  # GET /business_cards
  # GET /business_cards.json
  def index
    @business_cards = BusinessCard.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @business_cards }
    end
  end

  # GET /business_cards/1
  # GET /business_cards/1.json
  def show
    @business_card = BusinessCard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @business_card }
    end
  end

  # GET /business_cards/new
  # GET /business_cards/new.json
  def new
    @business_card = BusinessCard.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @business_card }
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
        format.html { redirect_to @business_card, notice: 'Business card was successfully created.' }
        format.json { render json: @business_card, status: :created, location: @business_card }
      else
        format.html { render action: "new" }
        format.json { render json: @business_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /business_cards/1
  # PUT /business_cards/1.json
  def update
    @business_card = BusinessCard.find(params[:id])

    respond_to do |format|
      if @business_card.update_attributes(params[:business_card])
        format.html { redirect_to @business_card, notice: 'Business card was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @business_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_cards/1
  # DELETE /business_cards/1.json
  def destroy
    @business_card = BusinessCard.find(params[:id])
    @business_card.destroy

    respond_to do |format|
      format.html { redirect_to business_cards_url }
      format.json { head :no_content }
    end
  end
end
