require 'rails_helper'

RSpec.describe Micropost, type: :model do
  before do
    @user = User.new(id: 1, name: 'User1', password_digest: 'User1')
  end

  subject do
    described_class.new(content: 'My post',
                        user_id: @user.id)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without a content' do
    subject.content = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without a user' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end
end
