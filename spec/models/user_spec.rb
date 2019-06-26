require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.name = Faker::Name.name
    subject.email = Faker::Internet.email

    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.email = Faker::Internet.email

    expect(subject).to_not be_valid
  end

  it "is not valid without an email" do
    subject.name = Faker::Name.name

    expect(subject).to_not be_valid
  end
end
