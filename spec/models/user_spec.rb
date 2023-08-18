require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create!(name: 'John Doe', photo: 'http://placehold.it/300x300', bio: 'some bio', posts_counter: 5) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be greater than or equal to 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
end
