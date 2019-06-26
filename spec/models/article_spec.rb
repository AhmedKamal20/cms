require 'rails_helper'

RSpec.describe Article, type: :model do
  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.title = Faker::Lorem.sentence
    subject.description = Faker::Lorem.paragraph
    subject.user = create(:user)

    expect(subject).to be_valid
  end

  it "is not valid without a user" do
    subject.title = Faker::Lorem.sentence
    subject.description = Faker::Lorem.paragraph

    expect(subject).to_not be_valid
  end

  it "is not valid without a title" do
    subject.description = Faker::Lorem.paragraph
    subject.user = create(:user)

    expect(subject).to_not be_valid
  end

  it "is valid without a description" do
    subject.title = Faker::Lorem.sentence
    subject.user = create(:user)

    expect(subject).to be_valid
  end

  it "belongs_to user" do
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :belongs_to
  end
end
