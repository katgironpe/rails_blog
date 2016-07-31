require 'rails_helper'

describe ApplicationHelper do
  describe '#site_title' do
    before do
      ENV['SITE_TITLE'] = nil
    end

    it 'returns correct default blog title if SITE_TITLE is nil' do
      expect(helper.site_title).to eq('A Rails Blog')
    end
  end

  describe '#page_title' do
    context "when @title is not assigned" do
      before do
        ENV['SITE_TITLE'] = 'A Movie Blog'
      end

      it 'returns the page title' do
        expect(helper.page_title).to eq('A Movie Blog')
      end
    end

    context "when @title is assigned" do
      before do
        @title = 'A Music Blog'
      end

      it 'returns the page title' do
        expect(helper.page_title).to eq('A Music Blog')
      end
    end
  end

  describe '#site_description' do
    before do
      ENV['SITE_DESCRIPTION'] = nil
    end

    it 'returns correct default blog description if SITE_DESCRIPTION is nil' do
      expect(helper.site_description).to eq('Your Blog Description')
    end
  end

  describe '#alert_message' do
    let(:message) { 'You have successfully signed up' }

    it 'returns correct markup' do
      expect(helper.alert_message(message)).to have_css('div.alert.alert-info')
    end
  end

  describe '#to_html' do
    context 'code block' do
      let(:text) { '```Some code block```' }

      it 'converts markdown to html' do
        expect(helper.to_html(text)).to have_selector('code')
      end
    end

    context 'strong text' do
      let(:text) { '**Something highlighted**' }

      it 'converts markdown to html' do
        expect(helper.to_html(text)).to have_selector('strong')
      end
    end
  end

  describe '#tag_links' do
    context 'when the resource is a post' do
      let(:tag) { create(:tag, name: 'science') }
      let(:post) { create(:post) }

      before do
        create(:tagging, taggable_id: post.id, tag_id: tag.id)
        post.reload
      end

      it 'returns tag links' do
        expect(helper.tag_links('posts', post.tag_names)).to eq(%(<a href="/tags/posts/#{tag.name}">#{tag.name}</a>))
      end
    end
  end
end
