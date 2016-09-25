require 'rails_helper'

describe User do
  let(:user) { create(:user, first_name: 'John', last_name: 'Doe') }

  it { should have_many(:articles).inverse_of(:user) }
  it { should have_many(:posts).inverse_of(:user) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }

  it { should validate_presence_of(:email) }
  #it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  it { should validate_presence_of(:password) }

  describe '#name' do
    it 'returns full name of the user' do
      expect(user.name).to eq('John Doe')
    end
  end
end
