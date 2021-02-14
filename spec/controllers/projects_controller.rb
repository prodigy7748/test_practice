require 'rails_helper'

RSpec.describe ProjectsController do
  it 'can get index' do
    get :index
    expect(response).to have_http_status(:success)
  end

  it 'can get new' do
    user = FactoryBot.create(:user)
    sign_in user
    get :new
    expect(response).to have_http_status(:success)
  end
end
