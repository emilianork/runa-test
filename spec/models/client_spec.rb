require 'rails_helper'

RSpec.describe Client, type: :model do

  context 'validations' do
    context 'name' do
      it do
        should validate_length_of(:name)
                 .is_at_least(2)
                 .is_at_most(50)
      end

      it { should validate_presence_of(:name) }

      it do
        should allow_value(Faker::Name.first_name).for(:name)

        should_not allow_value(Faker::Lorem.characters(51)).for(:name)
        should_not allow_value('--').for(:name)
      end
    end

    context 'paternal_last_name' do
      it do
        should validate_length_of(:paternal_last_name)
                 .is_at_least(2)
                 .is_at_most(50)
      end

      it { should validate_presence_of(:paternal_last_name) }

      it do
        should allow_value(Faker::Name.last_name).for(:paternal_last_name)
        
        should_not allow_value(Faker::Lorem.characters(51)).for(:paternal_last_name)
        should_not allow_value('--').for(:paternal_last_name)
      end
    end

    context 'maternal_last_name' do
      it do
        should validate_length_of(:maternal_last_name)
                 .is_at_least(2)
                 .is_at_most(50)
      end

      it { should validate_presence_of(:maternal_last_name) }

      it do
        should allow_value(Faker::Name.last_name).for(:maternal_last_name)
        
        should_not allow_value(Faker::Lorem.characters(51)).for(:maternal_last_name)
        should_not allow_value('--').for(:maternal_last_name)
      end
    end

    context 'gender' do
      it { should validate_length_of(:gender).is_equal_to(1) }
      it { should validate_presence_of(:gender) }

      it do
        should_not allow_value('1').for(:gender)

        should allow_value('F').for(:gender)
        should allow_value('M').for(:gender)
      end
    end

    context 'birthday' do
      it { should validate_presence_of(:birthday) }
      
      it do
        should allow_value(21.years.ago).for(:birthday)

        should_not allow_value(101.years.ago).for(:birthday)
        should_not allow_value(17.years.ago).for(:birthday)
      end
    end

    context 'document_type' do
      it { should validate_presence_of(:document_type) }
      
      it do
        should allow_value('passport').for(:document_type)
        should allow_value('visa').for(:document_type)
        should allow_value('curp').for(:document_type)

        should_not allow_value(Faker::Name.name).for(:document_type)        
      end

      it { should validate_uniqueness_of(:document_type).scoped_to(:document_number) }
    end

    context 'document_number' do
      let(:client) { FactoryBot.build(:client) }

      it 'is correct' do
        client.document_type = 'curp'
        client.document_number = "ABCDEFGHIJ12345678"

        expect(client.valid?).to be(true)
      end

      it 'has more than 18 characters' do
        client.document_type = 'curp'
        client.document_number = "ABCDEFGHIJK12345678"

        expect(client.valid?).to be(false)
      end

      it 'has less than 18 characters' do
        client.document_type = 'curp'
        client.document_number = ""

        expect(client.valid?).to be(false)
      end

      it 'has invalid characters' do
        client.document_type = 'curp'
        client.document_number = "ABCDEFGHIJ1234567-"

        expect(client.valid?).to be(false)
      end 
    end
  end
end
