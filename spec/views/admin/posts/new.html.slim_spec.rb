require 'rails_helper'

describe "admin/posts/new" do
  before(:each) do
    assign(:post, create(:post))
  end

  it "renders new post form" do
    render

    assert_select "input#post_title[name=?]", "post[title]"
    assert_select "textarea#post_body[name=?]", "post[body]"
  end
end
