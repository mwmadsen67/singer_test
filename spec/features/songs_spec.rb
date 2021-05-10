require 'rails_helper'

# feature is like rspec describe
feature 'creating a song', type: :feature do
  
  before(:each) do
    create(:user)
    log_in_user(User.last) # Need a logged in user to get passed before_action hook and give song an author
    visit(new_song_url)
  end

  # scenario is like rspec it
  scenario 'takes in a body' do
    # make sure we've been taken to the right page: ie, the one with 'Body' on it (song form) and 'Create a Song' (not edit)
    expect(page).to have_content('Body')
    expect(page).to have_content('Create a Song')
  end

  scenario 'takes us back to song show on successful submit' do
    make_song('over the rainbow!')

    # make sure we were redirected to a song show page
    # song_path is like song_url, except it excludes the domain (localhost:3000)
    expect(current_path).to eq(song_path(Song.last))
    expect(page).to have_content('Song Show Page')

    # make sure it's the show page of the song we just made
    expect(page).to have_content('over the rainbow!')
  end
end

feature 'deleting a song', type: :feature do
  before(:each) do
    create(:user)
    log_in_user(User.last)
    make_song('to be deleted')
    click_button('Delete the Song') # on show page
  end
  
  scenario 'deletes the song' do
    # make sure we're redirected to the index
    expect(page).to have_content('All the Songs')
    expect(page).to_not have_content('to be deleted')
  end
end