require 'rails_helper'

feature 'Posts' do
  let(:user) { build(:user) }
  let(:post) { build(:post, title: 'How to create React.js apps') }

  scenario 'User not signed signs up to create a new post' do
    reset_mailer
    sign_up(user)
    expect(page).to have_text(' A message with a confirmation link has been sent to your email address.')
    expect(unread_emails_for(user.email).count).to eq(1)
    open_email(user.email)
    expect(current_email).to have_body_text('You can confirm your account email through the link below')
    click_email_link_matching(/#{user_confirmation_path}/)
    expect(page).to have_content('Your email address has been successfully confirmed')

    visit root_path
    click_link 'Posts'
    expect(page).to have_title(ENV['SITE_TITLE'])
    expect(page).to_not have_text('Admin')
    expect(page).to have_text('Sign in')
    sign_in(user)

    expect(page).to_not have_text('Sign in')
    expect(page).to have_text('Admin')
    click_link 'Admin'
    click_link 'Create a new post'
    fill_in 'post[title]', with: post.title
    fill_in 'post[body]', with: post.body
    click_button 'Submit'
    expect(page).to have_text('Post was successfully created')

    click_link 'Posts'
    click_link post.title
    expect(page).to have_text(post.body)
  end
end
