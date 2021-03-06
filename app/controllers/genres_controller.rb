class GenresController < ApplicationController
      before_action :set_genre, only: %i(index create)
  def index
      @user = current_user
      @genre = Genre.new
  end

  def edit
      @user = User.find_by(id: params[:id])
      @genre = Genre.find_by(id: params[:id])
  end

  def create
      @genre = Genre.new(genre_params)
      @genre.user_id = current_user.id
    if @genre.save
       flash[:notice] = "タグを作成しました"
       redirect_to user_genres_path(current_user)
    else
       render action: :index
    end
  end

  def update
      @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
       flash[:notice] = "タグを更新しました"
       redirect_to user_genres_path
    else
       render action: :edit
    end
  end

  def destroy
      @genre = Genre.find(params[:id])
      @genre.user_id = current_user.id
      @genre.destroy
      flash[:alert] = "タグを削除しました"
      redirect_to user_genres_path
  end

  private
  def genre_params
      params.require(:genre).permit(:title, :status, :user_id)
  end

  def set_genre
      @genres = Genre.where(user: current_user)
  end
end
