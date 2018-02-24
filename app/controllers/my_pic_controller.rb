class MyPicController < ApplicationController

  def create
    @pic = MyPic.create!(todo_params)
    json_response(@pic, :created)
  end
  private

  def todo_params
    params.permit(:text, :format, :width, :height)
  end

end