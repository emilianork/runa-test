require 'rails_helper'

RSpec.describe Address, type: :model do
  context 'associations' do
    it { should belong_to(:client) }
  end

  context 'validations' do
    it { should validate_presence_of(:street1) }
    it { should validate_length_of(:street1).is_at_most(100) }

    it { should validate_presence_of(:street2) }
    it { should validate_length_of(:street2).is_at_most(100) }

    it { should validate_length_of(:street3).is_at_most(100) }

    it { should validate_presence_of(:city) }
    it { should validate_length_of(:city).is_at_most(100) }

    it { should validate_presence_of(:state) }
    it { should validate_length_of(:state).is_at_most(100) }
  end
end
