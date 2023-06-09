require 'rails_helper'

RSpec.describe MethodStep, type: :model do
  it { should validate_presence_of(:step)}
end
