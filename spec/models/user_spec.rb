require 'rails_helper'

describe User do
  describe '#name' do
    it 'has a name' do
      user = build(:user)
      expect(user.name).not_to be_nil
    end
  end
end
