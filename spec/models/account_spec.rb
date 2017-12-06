require 'rails_helper'

RSpec.describe Account, type: :model do
  context 'associations' do
    it { should belong_to(:client) }
  end

  context 'validations' do
    context 'account_number' do
      it { should validate_presence_of(:account_number) }
      it { should validate_length_of(:account_number).is_equal_to(14) }

      it 'should generate default value' do
        account = FactoryBot.build(:account)

        expect(account.account_number).to match(/\A\d{3,3}-\d{10,10}\z/)
      end
    end

    context 'currency' do
      it { should validate_presence_of(:currency) }

      it { should allow_value('USD').for(:currency) }
      it { should allow_value('MXN').for(:currency) }

      it { should_not allow_value("CAD").for(:currency) }
    end

    context 'balance' do
      it { should validate_presence_of(:balance) }
      it { should validate_numericality_of(:balance)
                    .only_integer
                    .is_greater_than_or_equal_to(0) }

      it 'should put default value 0' do
        account = FactoryBot.build(:account)

        expect(account.balance).to be(0)
      end
    end

    context 'monthly_maintenance_cost' do
      it { should validate_presence_of(:monthly_maintenance_cost) }
      it { should validate_numericality_of(:monthly_maintenance_cost)
                    .only_integer
                    .is_greater_than_or_equal_to(0) }

      it 'should put default value 0' do
        account = FactoryBot.build(:account)

        expect(account.monthly_maintenance_cost).to be(0)
      end
    end
  end
end
