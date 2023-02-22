class Api::V1::LikesController < ApplicationController
  # POST /likes
  def create
    @like = Like.find_or_create_by(like_params)
    @like.increment!(:count)

    if @like.save
      render json: @like, status: :created
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def like_params
    params.fetch(:like, {}).permit(:resource_id, :resource_type)
  end
end
