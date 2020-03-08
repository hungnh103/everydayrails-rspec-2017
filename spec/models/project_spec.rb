require 'rails_helper'

RSpec.describe Project, type: :model do
  it "does not allow duplicate project names per use" do
    user = FactoryBot.create(:user,
      first_name: "Joe",
      last_name: "Tester",
      email: "ahihi@email.com",
      password: "123645456"
    )

    user.projects.create( name: "Test Project" )
    new_project = user.projects.build( name: "Test Project")

    new_project.valid?
    expect(new_project.errors[:name]).to include("has already been taken")
  end

  it "allows two users to share a project name" do
    user = FactoryBot.create(:user,
      first_name: "ahihi",
      last_name: "bla blah",
      email: "test@email.com",
      password: "1rfji3r3"
    )

    user.projects.create(name: "Test Project")

    other_user = FactoryBot.create(:user,
      first_name: "fwef",
      last_name: "goijfw",
      email: "fjoig@email.com",
      password: "gai289#_+"
    )

    other_project = other_user.projects.build(name: "Test Project")

    expect(other_project).to be_valid
  end
end
