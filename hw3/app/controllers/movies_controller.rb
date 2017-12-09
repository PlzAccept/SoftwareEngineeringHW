class MoviesController < ApplicationController

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    
    unless session[:ratings]
      session[:ratings] = Hash[Movie.ratings.collect { |r| [r, 1] }]
      session[:order_by] = ""
    end
    
    unless params[:ratings] and params[:order_by]
      flash.keep
      redirect_to movies_path( { :ratings => params[:ratings] || session[:ratings], :order_by => params[:order_by] || session[:order_by] } )
    else
      session[:order_by] = params[:order_by]
      session[:ratings] = params[:ratings]
    
      @selected = params[:ratings].keys
      @movies = Movie.order(params[:order_by]).where( rating: @selected )
      @hilite = { params[:order_by] => "hilite" }
      @all_ratings = Movie.ratings
    end
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
