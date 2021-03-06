class Admin::GenresController < ApplicationController
	before_action :authenticate_admin_administrator!
	layout 'admin'
	def index
		@genres = Genre.all
		@genre = Genre.new
	end

	def create
	    @genre = Genre.new(genre_params)
	  if  @genre.save
	  	  flash[:success] = "ジャンル情報が登録されました。"
	      redirect_back(fallback_location: root_path)
	  else
	  	  @genres = Genre.all
	      render 'index'
	  end
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def update
	    @genre = Genre.find(params[:id])
	  if  @genre.update(genre_params)
	  	  flash[:success] = "ジャンル情報が変更されました。"
	      redirect_to admin_genres_path
	  else
	      render 'edit'
	  end
	end

	private
	   def genre_params
	       params.require(:genre).permit(:name,:is_status)
	   end
end
