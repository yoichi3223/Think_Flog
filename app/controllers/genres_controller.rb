class GenresController < ApplicationController
  
  def index
  @user = current_user
  @genre = Genre.new
  @genres = Genre.where(user: current_user)
  end

  def edit
  	@user = User.find_by(id:params[:id])
  	@genre = Genre.find_by(id:params[:id])
  end

  def create
    @genres = Genre.where(user: current_user)
  	@genre = Genre.new(genre_params)
    @genre.user_id = current_user.id
    if @genre.save
      flash[:notice] = "ジャンルを作成しました"
      redirect_to user_genres_path
     else
     	render action: :index
     end
  end

  def update
 	@genre =  Genre.find(params[:id])
  if @genre.update(genre_params)
  	flash[:notice] = "ジャンルを更新しました"
  	redirect_to user_genres_path
  else
  	render action: :render
	end


  end
  def destroy
  	@user = currnet_user.id
  	@genre =  Genre.find(params[:id])
  	@genre.destroy
  	flash[:aleart] = "ジャンルを削除しました"
  	redirect_to genres_path
  end

  private

  def genre_params
		params.require(:genre).permit(:title,:status,:user_id)
	end


end
