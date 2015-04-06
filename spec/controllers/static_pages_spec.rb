require "rails_helper"

RSpec.describe StaticPagesController, type: :controller do
  subject { page }

  describe "home page" do
    before { visit root_path }

    it { should have_title '' }
    it { should have_content 'd' }
    it { should have_link('Login') }
    it { should have_link('Bulletin Board', href: root_path) }
  end

end
