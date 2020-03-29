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

  it "sends a welcome email on account creation" do
    allow(UserMailer).to receive_message_chain(:welcome_email, :deliver_later)
    user = FactoryBot.create :user
    expect(UserMailer).to have_received(:welcome_email).with(user)
  end

  xit "performs geocoding" do
    user = FactoryBot.create :user, last_sign_in_ip: "161.185.207.20"
    expect {
      user.geocode
    }.to change(user, :location).from(nil).to("Brooklyn, New York, United States")
  end
end
