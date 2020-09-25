require 'rails_helper'

RSpec.describe List, type: :model do
  context "データが正しく保存される" do
    before do
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
end
