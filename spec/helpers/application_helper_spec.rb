require 'rails_helper'

describe ApplicationHelper do
  describe '#site_title' do
    before do
      ENV['SITE_TITLE'] = nil
    end

    it "returns correct default blog title if SITE_TITLE is nil" do
      expect(helper.site_title).to eq('A Rails Blog')
    end
  end

  describe '#site_description' do
    before do
      ENV['SITE_DESCRIPTION'] = nil
    end

    it "returns correct default blog description if SITE_DESCRIPTION is nil" do
      expect(helper.site_description).to eq('Your Blog Description')
    end
  end

  describe '#alert_message' do
    let!(:message) { 'You have successfully signed up' }

    it "returns correct markup" do
      expect(helper.alert_message(message)).to have_css('div.alert.alert-info')
    end
  end
end

