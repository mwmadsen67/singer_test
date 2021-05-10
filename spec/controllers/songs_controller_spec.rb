require 'rails_helper'

RSpec.describe SongsController, type: :controller do

  describe 'get #index' do
    it 'renders songs index' do
      # simulates GET request that hits SongsController#index
      get :index

      expect(response).to render_template(:index)
    end
  end

  describe 'get #new' do
    
    it 'brings up the form to make a song' do
      # by default, subject is instance of SongsController
      # need to get passed the 'require_logged_in' before_action hook
      # don't use real logged_in? (unit testing); just make it return true to simulate being logged in
      allow(subject).to receive(:logged_in?).and_return(true)
      get :new

      expect(response).to render_template(:new)
    end
  end

  describe 'delete #destroy' do
    let(:test_song) { create(:song) }

    it 'destroys the song' do
      # create request with `id` in params to simulate the wildcard :id
      delete :destroy, params: { id: test_song.id }

      expect(Song.exists?(test_song.id)).to be false
    end
  end

  describe 'post #create' do
    before(:each) do
      create(:user)
      # current user should return the user we created on line above
      allow(subject).to receive(:current_user).and_return(User.last)
    end

    context 'with valid params' do
      before(:each) do
        post :create, params: { song: { body: 'this is a valid song' } }
      end

      it 'creates the song' do
        expect(Song.last.body).to eq('this is a valid song')
      end

      it 'redirects to song show page' do
        expect(response).to redirect_to(song_url(Song.last))
      end
    end

    context 'with invalid params' do
      before(:each) do
        post :create, params: { song: { not_an_attribute: '' } }
      end

      it 'renders the new template' do
        expect(response).to render_template(:new)
        expect(response).to have_http_status(422)
      end

      it 'adds errors to flash' do
        expect(flash[:errors]).to be_present
      end
    end
  end
end