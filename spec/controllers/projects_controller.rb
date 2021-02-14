require 'rails_helper'

RSpec.describe ProjectsController do
  describe 'without login' do
    it 'can get index without login' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'can not get new without login' do
      get :new
      expect(response).to redirect_to new_user_session_path
    end
  end

  describe 'after login' do
    it 'can get new' do
      user = FactoryBot.create(:user)
      sign_in user
      get :new
      expect(response).to have_http_status(:success)
    end
  end
end
