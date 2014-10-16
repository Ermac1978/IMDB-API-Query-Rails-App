class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  require 'net/http'
  require 'json'

  QUERY_URL = 'http://www.myapifilms.com/imdb'

  def index
    render :inline => "<h1>Hello World!</h1>"
  end

  def hello_person
    if params[:greeting_type] == 'g'
      @greeting = "Goodbye"
    elsif params[:greeting_type] == 'h'
      @greeting = 'Hello'
    else
      @greeting = 'Um...'
    end
  end


  def pigatize
    @pigatize_text = params[:text].pigatize
  end


  def query_movie
    movie_title = params[:search]
    if movie_title.present?
      if params[:search_type] == "t"
        uri = URI(QUERY_URL + "?title=#{URI.escape(movie_title)}")
      else
        uri = URI(QUERY_URL + "?name=#{URI.escape(movie_title)}&filmography=1")
      end
      imdb_info_json = Net::HTTP.get(uri)
      imdb_info_ruby = JSON.parse(imdb_info_json)
      @imdb_info_var = imdb_info_ruby.first
    end
  end

=begin
  def query_movie
    imdb_file = File.read("Taken.json")
    @imdb_info_var = JSON.parse(imdb_file).first
  end
=end
end
