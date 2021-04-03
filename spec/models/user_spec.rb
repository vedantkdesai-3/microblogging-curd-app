require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.create(email: 'user@gmail.com',
                        password_digest: 'useruser')
  end

  before :each do 
    User.create(email: 'user1@gmail.com', password: 'password', name: 'User1')
  end 

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a email' do
    described_class.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a password' do
    described_class.password_digest = nil
    expect(subject).to_not be_valid
  end
end
