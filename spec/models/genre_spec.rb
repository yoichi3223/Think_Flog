require 'rails_helper'

RSpec.describe Genre, type: :model do
	before do
      @user = User.new
      @user.family_name = "橋本1"
      @user.first_name = "洋一1"
      @user.email = "test1@gmail.com"
      @user.save

   	  @genre = Genre.new
      @genre.title = "Hello WebCamp"
      @genre.user_id = 1
      @genre.status = 1
      @genre.save
    end
    it "全て入力してあるので保存される" do
      expect(@genre).to be_valid
    end
    context "データが正しく保存されない" do
    before do
      @genre = Genre.new
      @genre.title = ""
      @genre.user_id = 1
      @genre.status =
      @genre.save
    end
    it "titleが入力されていないので保存されない" do
      expect(@genre).to be_invalid
      expect(@genre.errors[:title]).to include("can't be blank")
      expect(@genre.errors[:status]).to include("can't be blank")
    end
  end
end