require 'rails_helper'

describe "posts/index" do
  let!(:post1) { create(:post, title: 'Title', body: 'MyText') }
  let!(:post2) { create(:post, title: 'Title', body: 'MyText') }

  before(:each) do
    assign(:posts, Post.order('created_at DESC').page(1))
  end

  it "renders a list of posts" do
    render
    assert_select "h2", :text => "Title".to_s, :count => 2
  end
end
