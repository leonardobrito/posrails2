class Api::V1::PicturesController < ApplicationController
  def create
    picture = Picture.new create_picture_params
    picture.image.attach create_picture_params[:image]
    if picture.save
      render json: picture, status: :ok, serializer: PictureSerializer
    else
      render json: { errors: picture.errors }, status: :unprocessable_entity
    end
  end

  def index
    render json: Picture.all , each_serializer: PictureSerializer
  end

  private

  def create_picture_params
    params.permit(:name, :image)
  end
end
