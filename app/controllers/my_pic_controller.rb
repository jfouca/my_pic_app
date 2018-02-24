class MyPicController < ApplicationController

  def create
    @pic = MyPic.create!(todo_params)

    @url = generate_from_pic(@pic)

    # extname = File.extname(filename)[1..-1]
    # mime_type = Mime::Type.lookup_by_extension(extname)
    # content_type = mime_type.to_s unless mime_type.nil?

    render :plain => @url
  end
  private

  def todo_params
    params.permit(:text, :format, :width, :height)
  end

  def generate_from_pic(pic)
    MyPicUrlService.new().generateFromPic(@pic)
  end

end