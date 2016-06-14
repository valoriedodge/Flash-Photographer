require 'rails_helper'

RSpec.describe Location, type: :model do
  it { is_expected.to have_many(:photographers)}
end
