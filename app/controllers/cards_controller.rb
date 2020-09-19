class CardsController < ApplicationController
      before_action :set_card, only: %i(show edit update destroy)

  def new
      @card = Card.new
      @list = List.find_by(id: params[:list_id])
  end

  def create
       @list = List.find_by(id: params[:list_id])
       @card = Card.new(card_params)
    if @card.save
       flash[:notice] = "カードを作成しました"
       redirect_to top_index_path
    else
       render action: :new
    end
  end

  def show
  end

  def edit
      @list = List.where(user: current_user)
  end


  def update
        @list = List.where(user: current_user)
    if  @card.update_attributes(card_params)
        flash[:notice] = "カードを更新しました"
        redirect_to top_index_path
    else
        render action: :edit
    end
  end

  def destroy
      @card.destroy
      flash[:alert] = "カードを削除しました"
      redirect_to top_index_path
  end

  private
  def card_params
      params.require(:card).permit(:title, :memo, :list_id)
  end

  def set_card
      @card = Card.find_by(id: params[:id])
  end
end
