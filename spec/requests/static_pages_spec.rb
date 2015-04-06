require "rails_helper"

describe 'StaticPages' do
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_title "Bulletin Board" }
    it { should have_link "Bulletin Board", href: root_path }

    context "for non sign-in user" do
      it { should have_link "Login", href: new_user_session_path }
      it { should have_link "Sign up", href: new_user_registration_path }
    end

    context "for sign-in user" do
      let(:user) { FactoryGirl.create :user }
      before { sign_in user }

      it { should have_link 'Log out', href: destroy_user_session_path }
      it { should have_link 'Profile' }
      it { should have_link 'Settings', href: edit_user_registration_path }
      it { should_not have_link 'Login' }
      it { should have_selector 'button', text: 'Menu' }
      it { should have_selector 'img' }
    end
  end
end
