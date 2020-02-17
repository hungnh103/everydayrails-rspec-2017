require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a first name, last name, email and password" do
    user = User.new(
      first_name: "Hung",
      last_name: "Nguyen",
      email: "hungnh@email.com",
      password: "123456"
    )
    expect(user).to be_valid
  end

  it "is invalid without a first name" do
    user = User.new(first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it "is invalid without a last name" do
    user = User.new(last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end

  it "is invalid with a duplicate email address" do
    User.create(
      first_name: "abc",
      last_name: "hihi",
      email: "test@email.com",
      password: "123456"
    )

    user = User.new(
      first_name: "abc2",
      last_name: "hihi2",
      email: "test@email.com",
      password: "12345678"
    )

    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it "returns a user's full name as a tring" do
    user = User.new(
      first_name: "John",
      last_name: "Doe",
      email: "afj@email.com"
    )

    expect(user.name).to eql "John Doe"
  end
end
