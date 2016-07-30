shared_examples 'a restricted index page action' do
  context 'when user is not signed in' do
    it 'redirects to sign in page' do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end

shared_examples 'a restricted new page action' do
  context 'when user is not signed in' do
    it 'redirects to sign in page' do
      get :new
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
