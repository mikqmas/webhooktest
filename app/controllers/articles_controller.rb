class ArticlesController < ApplicationController
  def create
    puts "hello logs"
    puts request.body.read
    render json: request.body.read
  end
end
