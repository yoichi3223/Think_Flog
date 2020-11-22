class TopController < ApplicationController
  	def index
        @lists = List.where(user: current_user).order("created_at ASC")
        @list = List.new
        @genre = Genre.where(user: current_user,status: :true)
    end
end
