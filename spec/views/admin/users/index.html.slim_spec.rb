require 'rails_helper'

describe "admin/users/index" do
  let!(:user) { create(:user) }

  before(:each) do
    assign(:users, User.order('last_name ASC').page(1))
  end

  it "renders a list of admin/users" do
    render
  end
end
