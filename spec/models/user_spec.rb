require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:events) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it "user not create wiht email nil" do
    user = build(:user, email: '')
    expect(user).to_not be_valid
  end

  it "return the correct user name " do
    user = User.create(name: 'Pedro', email: "pedro@email.com",  password: '123456789')
    expect(user.name).to eq('Pedro')
  end

end
