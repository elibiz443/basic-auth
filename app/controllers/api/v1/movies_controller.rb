class Api::V1::MoviesController < ApplicationController
  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render json: { message: "movie sent 👍", movie: @movie }, status: :created
    else
      render json: { errors: @movie.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :movie_type, :release_date, :rating, :user_id)
  end
end
