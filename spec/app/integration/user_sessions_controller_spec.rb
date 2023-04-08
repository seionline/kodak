# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Auth::UserSessionsController', type: :request do
  fixtures :users

  let(:user) { users(:user) }

  it 'gets new' do
    get new_auth_session_url
    expect(response).to have_http_status(:success)
  end

  context 'when user is logged in successfully' do
    before do
      post auth_session_url, params: { auth_session: { email: user.email, password: 'user_password' } }
    end

    it { expect(session[:current_user_id]).to eq(user.id) }
    it { expect(response).to redirect_to(home_url) }
  end

  context 'when user log in fails' do
    before do
      post auth_session_url, params: { auth_session: { email: user.email, password: 'wrong_password' } }
    end

    it { expect(session[:current_user_id]).to be_nil }
    it { expect(response).to have_http_status(:unprocessable_entity) }
  end

  context 'when logging out' do
    before do
      post auth_session_url, params: { auth_session: { email: user.email, password: 'user_password' } }
      delete auth_session_url
    end

    it { expect(session[:current_user_id]).to be_nil }
    it { expect(response).to redirect_to(home_url) }
  end
end
