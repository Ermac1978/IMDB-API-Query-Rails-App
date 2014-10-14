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
    if params[:greeting_tye] == 'g'
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


#http://localhost:3000/query_movie?title=Oblivion
  def query_movie
#    movie_title = value of the Hash (which is a string), in this case "Oblivion"
    movie_title = params[:title]
    uri = URI(QUERY_URL + "?title=#{URI.escape(movie_title)}")
    imdb_info_json = Net::HTTP.get(uri)
    imdb_info_ruby = JSON.parse(imdb_info_json)
    @imdb_info_var = imdb_info_ruby.first
  end



end
