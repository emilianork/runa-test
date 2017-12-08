require 'rails_helper'

RSpec.describe Card, type: :model do
  context 'associations' do
    it {
      should belong_to(:usd_account)
        .class_name('Account')
    }

    it {
      should belong_to(:mxn_account)
        .class_name('Account')
    }
  end

  context 'validations' do
    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:exp_month) }
    it { should validate_presence_of(:exp_year) }
    it { should validate_presence_of(:cvv) }
    it { should validate_presence_of(:blocked) }
    it { should validate_presence_of(:pin) }

    it { should validate_uniqueness_of(:number).case_insensitive }
  end
end
