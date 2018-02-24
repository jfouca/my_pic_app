require 'rails_helper'

RSpec.describe MyPic, type: :model do
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:format) }
    it { should validate_presence_of(:width) }
    it { should validate_presence_of(:height) }
end
