class MyPicsController < ApplicationController::API
  include Response

  def create
    @todo = MyPic.create(todo_params)
    json_response(@todo, :created)
  end
  private

  def todo_params
    params.permit(:text, :format, :width, :height)
  end

end