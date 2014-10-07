require 'spec_helper'

describe "static_pages" do

  subject { page }

  describe "home page" do
    # 1. Visit the home page
    before { visit home_path }
    # 2. it should have a h1 tag of "Welcome"
    it { should have_selector('h1', "Welcome") }
    # 3. it should have a title of "Todo | Home"
    it { should have_title("Todo | Home") }    
  end

  describe "about" do
    before { visit about_path }
    # it should have a h1 tab of "About Me"
    it { should have_selector('h1', "About Me") } 
    # it should have a title of "Todo | About Me"
    it { should have_title("Todo | About Me") }
  end

  describe "help" do
    before { visit help_path }
    # it should have h1 of "Help /FAQ"
    it { should have_selector('h1', "Help / FAQ") }
    # it should have a title of "Todo | Help"
    it { should have_title("Todo | Help") }
  end
end