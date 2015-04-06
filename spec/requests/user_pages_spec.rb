require "rails_helper"

describe 'User pages' do
  let(:user) { FactoryGirl.create :user }
  before(:each) { sign_in user }

  subject { page }

  describe 'Show page' do
    before { visit user_path user }

    it { should have_title 'Bulletin Board' }
    it { should have_content user.name }
    it { should have_selector 'img' }
  end

  describe 'Settings page' do
    before { visit edit_user_registration_path }

    it { should have_content 'Settings' }
    it { should have_content 'Delete' }
  end
end
