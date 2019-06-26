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

  it "has_many articles" do
    assc = described_class.reflect_on_association(:articles)
    expect(assc.macro).to eq :has_many
  end

  it "could have articles" do
    subject.name = Faker::Name.name
    subject.email = Faker::Internet.email
    article_1 = create(:article, user: subject)
    article_2 = create(:article, user: subject)

    expect(subject.articles.count).to eq(2)
  end
end
