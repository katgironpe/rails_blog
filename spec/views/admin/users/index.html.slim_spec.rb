require 'rails_helper'

describe "admin/users/index" do
  before(:each) do
    assign(:users, [create(:user)])
  end

  it "renders a list of admin/users" do
    render
  end
end
