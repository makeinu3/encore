class Admin::GenresController < ApplicationController

  before_action :authenticate_admin!
  before_action :set_sidebar                 # @customers, @posts, @messages
  before_action :set_post, except: [:index]  # Genre.find(params[:id])

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path
  end

  def edit
  end

  def update
    @genre.update(genre_params)
    redirect_to admin_genres_path
  end



  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
