# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "StaticPages" do

	subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1',    text: heading) }
    it { should have_selector('title', 
                              text: full_title(page_title)) }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact')
    click_link "Home"
    click_link "Sign up now!"
    page.should have_selector 'title', text: full_title('Sign up')
    click_link "sample app"
    page.should have_selector 'title', text: full_title('')
  end

  describe "Home Page" do
    before { visit root_path }

    let(:heading)    { 'Sample App' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_selector('title', text: "| Home") }   

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.content)
        end
      end

      describe "information sidebar" do

        it "should pluralize the number of posts" do
          page.should have_selector('span', text: "microposts")
        end

        it "should not pluralize the number of posts" do
          user.feed.first.destroy
          page.should have_selector('span', text: "micropost")
        end
      end
    end 
  end

  describe "Help Page" do
    before { visit help_path }
    
    let(:heading)    { 'Help' }
    let(:page_title) { 'Help' }
    
    it_should_behave_like "all static pages"
  end

  describe 'About Us' do
  	before { visit about_path }

    let(:heading)    { 'About' }
    let(:page_title) { 'About' }
    
    it_should_behave_like "all static pages"
	end

  describe 'Contact Us' do
    before { visit contact_path }

    let(:heading)    { 'Contact' }
    let(:page_title) { 'Contact' }

    it_should_behave_like "all static pages"
  end
end
