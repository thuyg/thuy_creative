class TinymceAssetsController < ApplicationController
  respond_to :json

  def create
    geometry = Paperclip::Geometry.from_file params[:file]
    image    = Image.create(image_params)

    render json: {
      image: {
        url:    image.file.url,
        height: geometry.height.to_i,
        width:  geometry.width.to_i
      }
    }, layout: false, content_type: "text/html"
  end
  
  private
  
  def image_params
    params.require(:image).permit(:file, :alt, :hint)  
  end
  
end
