class Api::V1::LikesController < ApplicationController
  # POST /likes or /likes.json
  def create
    @like = Like.new(like_params)

    respond_to do |format|
      if @like.save
        format.html{ redirect_to like_url(@like), notice: "Like was successfully created." }
        format.json{ render :show, status: :created, location: @like }
      else
        format.html{ render :new, status: :unprocessable_entity }
        format.json{ render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def like_params
    params.require(:like).permit(:resource_type, :resource_id, :count)
  end
end
