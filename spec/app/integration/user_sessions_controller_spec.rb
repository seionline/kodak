# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UserSessionsController', skip: 'these need to be fixed and make rspec-y', type: :request do
  fixtures :users

  it 'gets new' do
    get new_user_session_url
    assert_response :success
  end

  it 'logs user in successfully' do
    post user_session_url, params: { user_session: { email: user.email, password: 'user_password' } }
    expect(:user.id).to eq(session[:current_user_id])
    assert_redirected_to root_url
  end

  it 'fails to log in user' do
    post user_session_url, params: { user_session: { email: 'user', password: 'wrong_password' } }
    assert_nil session[:current_user_id]
    assert_response :unprocessable_entity
  end

  it 'logs out user' do
    post user_session_url, params: { user_session: { email: 'user', password: 'user_password' } }
    assert_redirected_to root_url

    delete user_session_url
    assert_nil session[:current_user_id]
    assert_redirected_to root_url
  end
end
