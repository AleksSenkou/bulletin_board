require "rails_helper"

RSpec.describe 'Admin pages' do
  let(:admin) { FactoryGirl.create :user, admin: true }
  before { sign_in admin }

  describe 'Users index' do
    let(:user) { FactoryGirl.create :user, email: 'user@user.com' }
    before { visit users_path }

    context 'content' do

    end
  end
end
