require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "user creates a new post", %q{
  As a User
  I want to create a new Post
  So that I can share my opinions with other readers
} do

  # Acceptance Criteria:
  # - I must specify a title
  # - I must specify some content
  # - I must specify an author

  let(:title) { "Awesome Post Title, DUDE" }
  let(:content) { "Superb content, this post has." }
  let(:user) { FactoryGirl.create(:user) }
  background do
    login_as(user, :scope => :user)
  end

  scenario "author creates a post with valid attributes" do
    visit root_path
    click_on "Add Post"
    fill_in_form_with_valid_attributes
    click_on "Create Post"
    expect(page).to have_content "Post created successfully!"
  end

  scenario "author attempts to create a Post without valid attributes" do
    visit root_path
    click_on "Add Post"
    click_on "Create Post"
    expect(page).to have_content "You need to provide valid attributes!"
  end

  scenario "author visits new post path" do
    visit new_post_path
    expect(page).to have_button "Create Post"
  end

  scenario "normal user (non-author) cannot create post" do
    logout(:user)
    user.role = "user"
    login_as(user, scope: :user)
    visit root_path
    expect(page).to_not have_content "Add Post"
  end

  scenario "non-author visits new post path" do
    logout(:user)
    user.role = "user"
    login_as(user, scope: :user)
    visit new_post_path
    expect(page).to_not have_button "Create Post"
  end

  def fill_in_form_with_valid_attributes
    fill_in "Title", with: title
    fill_in "Content", with: content
  end
end
