require 'rails_helper'

describe Admin::UsersController, type: :controller do

  let(:valid_attributes) { attributes_for(:user) }

  let(:invalid_attributes) { attributes_for(:user, email: '', last_name: '') }

  describe 'GET #index' do
    it_behaves_like 'a restricted index page action'

    context 'when user is signed in' do
      let!(:user) { create(:user) }
      before { sign_in_user }

      it 'assigns all admin_users as @admin_users' do
        get :index
        expect(assigns(:users).count).to eq(2)
      end
    end
  end

  describe 'GET #show' do
    context 'when user is not signed in' do
      it 'redirects to sign in page' do
        user = User.create! valid_attributes
        get :show, params: { id: user.to_param }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user is signed in' do
      before { sign_in_user }

      it 'assigns the requested admin_user as @admin_user' do
        user = User.create! valid_attributes
        get :show, params: { id: user.to_param }
        expect(assigns(:user)).to eq(user)
      end
    end
  end

  describe 'DELETE #destroy' do
    before { sign_in_user }

    it 'destroys the requested admin_user' do
      user = User.create! valid_attributes
      expect {
        delete :destroy, params: { id: user.to_param }
      }.to change(User, :count).by(-1)
    end

    it 'redirects to the admin_users list' do
      user = User.create! valid_attributes
      delete :destroy, params: { id: user.to_param }
      expect(response).to redirect_to(admin_users_url)
    end
  end
end
