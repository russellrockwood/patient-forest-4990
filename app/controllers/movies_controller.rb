class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @names = @movie.names_by_age
    @average_age = @movie.average_age
  end
end
