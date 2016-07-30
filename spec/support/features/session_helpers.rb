module Features
  module SessionHelpers
    def sign_up(user)
      visit sign_up_path
      fill_in 'user_first_name', with: user.first_name
      fill_in 'user_last_name', with: user.last_name
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      fill_in 'user_password_confirmation', with: user.password
      click_button 'Sign up'
    end

    def create_user
      user = create(:user)
      user.tap do |u|
        u.confirmed_at = Time.now
        u.save!
      end
    end

    def sign_in(user)
      visit root_path
      click_link 'Sign in'
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Sign in'
    end

    def sign_out
      click_link 'Sign out'
    end
  end
end
