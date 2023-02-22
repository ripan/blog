class Api::V1::ArticlesController < ApplicationController
  def index
    articles = Articles::List.call
    render json: articles
  end
end
