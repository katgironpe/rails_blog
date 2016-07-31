require 'rails_helper'

describe "articles/show" do
  before(:each) do
    @article = assign(:article, create(:article, title: 'Title', body: 'MyText'))
    view.stub(:react_component).and_return('Comments')
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
