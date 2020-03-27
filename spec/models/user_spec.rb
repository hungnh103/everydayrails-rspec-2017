require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build :user).to be_valid
  end

  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.to validate_presence_of :last_name }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

  it "returns a user's full name as a tring" do
    user = FactoryBot.build(:user, first_name: "John", last_name: "Doe")

    expect(user.name).to eql "John Doe"
  end

  describe "returns a user's full name as a tring" do
    subject(:user) { FactoryBot.build(:user, first_name: "John", last_name: "Doe") }
    it { is_expected.to satisfy { |user| user.name == "John Doe" } }
  end
end
