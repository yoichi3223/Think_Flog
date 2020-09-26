require 'rails_helper'

RSpec.describe User, type: :model do
before do
      @user = User.new
      @user.family_name = "橋本"
      @user.first_name = "洋一"
      @user.email = "test1@gmail.com"
      @user.save
    end
    it "全て入力してあるので保存される" do
      expect(@user).to be_valid
    end
    context "データが正しく保存されない" do
    before do
      @user = User.new
      @user.family_name = ""
      @user.first_name = ""
      @user.email = ""
      @user.save
    end
    it "titleが入力されていないので保存されない" do
      expect(@user).to be_invalid
      expect(@user.errors[:family_name]).to include("can't be blank")
      expect(@user.errors[:first_name]).to include("can't be blank")
      expect(@user.errors[:email]).to include("can't be blank")
    end
  end

end
