# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  fixtures :users
  let(:user) { users(:user) }

  describe '#name' do
    it 'returns full name' do
      expect(user.name).to eq('Astrid Lindgren') 
    end
  end
end
