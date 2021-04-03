require 'rails_helper'

RSpec.describe Follow, type: :model do

  before do
    @user_1 = User.new(id: 1, name: 'User1', password_digest: 'User1')
    @user_2 = User.new(id: 2, name: 'User2', password_digest: 'User2')
  end

  subject do
    described_class.new(user_id: @user_1.id,
               following_user_id: @user_2.id)
  end

  it 'is not valid without a following_user_id' do
    subject.following_user_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a user_id' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with both refering to null' do
    expect(Follow.new(user_id: nil, following_user_id: nil)).to_not be_valid
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
