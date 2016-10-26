
require 'test_helper'

feature 'Pictures' do

  scenario 'as an authenticated user, new pictures I save go to my gallery', js: true do
    login_user
    visit root_path
    click_on 'Create New'
    accept_prompt with: 'image_new' do
      click_on 'Change Name'
    end
    page.must_have_content 'image_new'
    click_on 'Save Picture'
    sleep 5
    page.execute_script('$.modal.close();')
    click_on 'My Pictures'
    page.must_have_content 'image_new'
  end

  scenario 'As a picture owner, I can delete my pictures' do
    login_user
    visit gallery_path(galleries(:tony_gallery).id)
    click_on 'tony_picture03'
    click_on 'Delete Picture'
    page.wont_have_content 'tony_picture03'
  end

  scenario "a non-owner user, I cannot delete other people's pictures" do
    visit galleries_path
    click_on "Galactus the World Devourer's pictures"
    page.wont_have_content 'Delete'
  end

  scenario "as an authenticated user, I can branch anybody's pictures" do
  end

  scenario "as an unauthenticated user, I am promted to login or register to branch other people's pictures" do
  end

  # I haven't been able to make these tests work on Travis CI. They seem to be having some sort of
  # JS script failure that I can't diagnose.
  # http://stackoverflow.com/questions/40098319/rails-javascript-test-fails-on-travis-ci-works-locally

  scenario 'as a picture owner, I can change the name of a picture via the editor', js: true do
    if ENV['ON_TRAVIS'] != 'true'
      login_user
      visit picture_path(pictures(:tony_picture01).id)
      page.must_have_content 'tony_picture01'
      click_on 'Edit Picture In Painter'
      page.must_have_content 'tony_picture01'
      accept_prompt with: 'renamed_picture' do
        click_on 'Change Name'
      end
      page.wont_have_content 'tony_picture01'
      page.must_have_content 'renamed_picture'
      visit picture_path(pictures(:tony_picture01).id)
      page.wont_have_content 'tony_picture01'
      page.must_have_content 'renamed_picture'
    end
  end

  scenario 'as a picture owner, I can change the name of a picture via picture display', js: true do
    if ENV['ON_TRAVIS'] != 'true'
      login_user
      visit show_picture_path(pictures(:tony_picture02).id)
      page.must_have_content 'tony_picture02'
      accept_prompt with: 'renamed_picture02' do
        click_on 'Change Name'
      end
      page.wont_have_content 'tony_picture02'
      page.must_have_content 'renamed_picture02'
      visit show_picture_path(pictures(:tony_picture02).id)
      page.wont_have_content 'tony_picture02'
      page.must_have_content 'renamed_picture02'
    end
  end

end
