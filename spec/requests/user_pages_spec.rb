require "rails_helper"

describe 'User pages' do
  let(:user) { FactoryGirl.create :user }
  before { sign_in user }

  subject { page }

  describe 'Show page' do
    before { visit user_path user }

    it { should have_title 'Bulletin Board' }
    it { should have_content user.name }
    it { should have_selector 'img' }
  end

  describe 'Settings page' do
    before { visit edit_user_registration_path }

    context 'content' do
      it { should have_content 'Settings' }
      it { should have_content 'Delete' }
      it { should have_content 'Cancel' }
      it { should have_link 'Change' }
    end

    context 'with valid info' do
      let(:new_name) { 'Alex' }
      let(:new_email) { 'alex@com.com' }
      before {
        fill_in 'Name', with: new_name
        fill_in 'Email', with: new_email
        fill_in 'Current password', with: user.password
        click_button 'Edit'
      }

      it { should have_selector 'div.alert.alert-notice.alert-dismissible' }
      it { should have_link 'Profile' }
      specify { expect(user.reload.name).to  eq new_name }
      specify { expect(user.reload.email).to eq new_email }
    end
  end
end
