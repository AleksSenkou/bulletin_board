require "rails_helper"

describe 'User pages' do
  subject { page }

  describe 'show' do
    let(:user) { FactoryGirl.create :user }
    before {
      sign_in user
      visit user_path user
    }

    it { should have_title 'Bulletin Board' }
    it { should have_content user.name }
    it { should have_selector 'img' }
  end
end
