require 'rails_helper'

RSpec.describe Card, type: :model do
context "データが正しく保存される" do
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

      @list = List.new
      @list.title = "Hello WebCamp"
      @list.user_id = 1
      @list.genre_id = 1
      @list.save

   	  @card = Card.new
   	  @card.title = "タイトルテスト"
   	  @card.memo = "メモテスト"
   	  @card.list_id = 1
   	  @card.position = 1
   	  @card.save
    end
    it "全て入力してあるので保存される" do
      expect(@card).to be_valid
    end
  end
  context "データが正しく保存されない" do
    before do
      @card = Card.new
      @card.title = ""
   	  @card.memo = "メモテスト"
   	  @card.list_id = 1
   	  @card.position = 1
   	  @card.save
    end
    it "titleが入力されていないので保存されない" do
      expect(@card).to be_invalid
      expect(@card.errors[:title]).to include("is too short (minimum is 1 character)")
    end
  end
end
