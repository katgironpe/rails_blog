require 'rails_helper'

describe "posts/show" do
  before(:each) do
    @post = assign(:post, create(:post, title: 'Title', body: 'MyText'))
    view.stub(:react_component).and_return('Comments')
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
