require 'rails_helper'

RSpec.describe List, type: :model do
  context "データが正しく保存される" do
    before do
      # binding.pry
      @user = User.new
      @user.family_name = "橋本"
      @user.first_name = "洋一"
      @user.email = "test@gmail.com"
      @user.save

      @genre = Genre.new
      @genre.title = "test"
      @genre.status = 1
      @genre.user_id = 1
      @genre.save

      @list = List.new
      @list.title = "Hello WebCamp"
      @list.user_id = 1
      @list.genre_id = 1
      @list.save
    end
    it "全て入力してあるので保存される" do
      expect(@list).to be_valid
    end
  end
  context "データが正しく保存されない" do
    before do
      @list = List.new
      @list.title = ""
      @list.user_id =1
      @list.genre_id =1
      @list.save
    end
    it "titleが入力されていないので保存されない" do
      expect(@list).to be_invalid
      expect(@list.errors[:title]).to include("can't be blank")
    end
  end
end
