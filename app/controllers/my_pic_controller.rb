class MyPicController < ApplicationController
    require 'faraday'

  def create
    @pic = MyPic.create!(todo_params)

    @content = generate_from_pic(@pic)

    send_data(
        @content,
        type: "image/#{@pic['format']}",
        disposition: 'inline'
    )
  end
  private

  def todo_params
    params.permit(:text, :format, :width, :height)
  end

  def generate_from_pic(pic)
    MyPicUrlService.new(Faraday.new()).generateFromPic(@pic)
  end

end