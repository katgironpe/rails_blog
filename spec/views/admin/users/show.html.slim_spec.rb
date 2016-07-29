require 'rails_helper'

describe "admin/users/show" do
  before(:each) do
    @user = assign(:admin_user, create(:user))
  end

  it "renders attributes in <p>" do
    render
  end
end
