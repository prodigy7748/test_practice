require 'rails_helper'

RSpec.describe ProjectsController do
  before do
    @user = FactoryBot.create(:user)
    sign_in @user
    @project = FactoryBot.create(:project)
  end

  describe 'without login' do
    it 'can get index without login' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'can not get new without login' do
      sign_out @user
      get :new
      expect(response).to redirect_to new_user_session_path
    end
  end

  describe 'after login' do
    it 'can get new' do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'can view project' do
      get :show, params: { id: @project.id }
      expect(response).to have_http_status(:success)
    end

    it 'can update project' do
      put :update, params: { id: @project.id, project: { title: 'updated project' } }
      @project.reload
      expect(@project.title).to eq 'updated project'
    end

    it 'cannot update project with invalid title' do
      put :update, params: { id: @project.id, project: { title: '' } }
      expect(response).to render_template(:edit)
    end

    it 'can destroy project' do
      delete :destroy, params: { id: @project.id }
      expect(response).to redirect_to projects_path
    end
  end
end
