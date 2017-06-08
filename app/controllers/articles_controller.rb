class ArticlesController < ApplicationController
  def create
    render json: request.body.read
  end
end
