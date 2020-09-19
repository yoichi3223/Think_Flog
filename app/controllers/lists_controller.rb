class ListsController < ApplicationController
      before_action :set_list, only: %i(edit update destroy)

  def new
      @list = List.new
      @genre = Genre.where(user: current_user)
  end

  def create
      @list = List.new(list_params)
    if @list.save
       flash[:notice] = "リストを作成しました"
       redirect_to top_index_path
    else
       render action: :new
    end
  end

  def edit
      @genre = Genre.where(user: current_user)
  end

  def show
      @list = List.find(params[:id])
      @cards = @list.cards
  end

  def update
    if @list.update_attributes(list_params)
       flash[:notice] = "リストを更新しました"
       redirect_to top_index_path
    else
       render action: :edit
    end
  end

  def destroy
      @list.destroy
      flash[:alert] = "リストを削除しました"
      redirect_to top_index_path
  end

  private

  def set_list
      @list = List.find_by(id: params[:id])
  end

  def list_params
      params.require(:list).permit(:title, :genre_id).merge(user: current_user)
  end
end
