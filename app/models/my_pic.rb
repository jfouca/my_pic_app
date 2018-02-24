class MyPic < ApplicationRecord
    # validations
    validates_presence_of :text, :format, :width, :height
end
