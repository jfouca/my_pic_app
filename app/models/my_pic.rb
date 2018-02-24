class MyPic < ApplicationRecord
    # validations
    FORMAT_OPTIONS = %w(jpg png)

    validates :format, :inclusion => {:in => FORMAT_OPTIONS}
    validates :width, numericality: { greater_than_or_equal_to: 1,  only_integer: true }
    validates :height, numericality: { greater_than_or_equal_to: 1,  only_integer: true }

    validates_presence_of :text, :format, :width, :height
end
