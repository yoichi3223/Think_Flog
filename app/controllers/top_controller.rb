class TopController < ApplicationController
      def index
        @card = Card.new
        @lists = List.where(user: current_user).order("created_at ASC")
        @list = List.new
        @genre = Genre.new
        @genres = Genre.where(user: current_user,status: :true)
    end
end
