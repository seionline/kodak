# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UserSessionsController', type: :request do
  fixtures :users

  it 'should get new' do
    get new_user_session_url
    assert_response :success
  end

  it 'should log user in successfully' do
    post user_session_url, params: { user_session: { email: user.email, password: 'user_password' } }
    assert_equal :user.id, session[:current_user_id]
    assert_redirected_to root_url
  end

  it 'should fail to log in user' do
    post user_session_url, params: { user_session: { email: 'user', password: 'wrong_password' } }
    assert_nil session[:current_user_id]
    assert_response :unprocessable_entity
  end

  it 'should log out user' do
    post user_session_url, params: { user_session: { email: 'user', password: 'user_password' } }
    assert_redirected_to root_url

    delete user_session_url
    assert_nil session[:current_user_id]
    assert_redirected_to root_url
  end
end
