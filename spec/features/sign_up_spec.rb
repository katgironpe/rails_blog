require 'rails_helper'

feature 'Sign up' do
  let(:user) { build(:user) }

  scenario 'User not signed creates a new account and confirms it' do
    reset_mailer
    sign_up(user)
    expect(page).to have_text(' A message with a confirmation link has been sent to your email address.')
    expect(unread_emails_for(user.email).count).to eq(1)
    open_email(user.email)
    expect(current_email).to have_body_text('You can confirm your account email through the link below')
    click_email_link_matching(/#{user_confirmation_path}/)
    expect(page).to have_content('Your email address has been successfully confirmed')
  end
end

