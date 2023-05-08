class Api::V1::MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :update, :destroy]

  def index
    @movies = Movie.all
    render json: { movie: @movies }, status: :ok
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render json: { message: "movie sent 👍", movie: @movie }, status: :created
    else
      render json: { errors: @movie.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end


  def movie_params
    params.require(:movie).permit(:title, :description, :movie_type, :movie_link, :release_date, :rating, :user_id)
  end
end
