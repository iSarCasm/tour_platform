require 'rails_helper'

RSpec.describe '/admin/notes' do
  include Devise::Test::IntegrationHelpers

  describe 'GET' do
    it 'returns all notes for specified noteable object in time order' do
      Timecop.freeze Time.local(2008, 9, 1, 12, 0, 0)
      sign_in create(:superadmin)
      hotel = create :hotel
      other_hotel = create :hotel
      john = create(:user, first_name: 'John', last_name: 'Male')
      ferry = create(:user, first_name: 'Ferry', last_name: 'Brain')
      note_1 = create :note, user: john, message: 'Hello, nice work!', object: hotel
      note_2 = create :note, user: ferry, message: 'Thanks!', object: hotel
      create :note, user: ferry, message: 'Wow amazing!', object: other_hotel

      get '/ext/admin/notes.json', params: { type: 'hotel', id: hotel.id }

      expect(json_body['notes']).to match_array [
          {
            'id' => note_1.id,
            'user_name' => 'John Male',
            'message' => 'Hello, nice work!',
            'created_at' => '2008-09-01T09:00:00.000Z'
          },
          {
            'id' => note_2.id,
            'user_name' => 'Ferry Brain',
            'message' => 'Thanks!',
            'created_at' => '2008-09-01T09:00:00.000Z'
          }
        ]
    end

    it 'doesnt allow guests' do
      get '/ext/admin/notes.json'

      expect(response.status).to eq 302
    end

    it 'doesnt allow users without access' do
      sign_in create(:user)

      get '/ext/admin/notes.json'

      expect(response.status).to eq 302
    end
  end

  describe 'POST' do
    it 'creates a new note' do
      sign_in create(:superadmin)
      hotel = create :hotel

      post '/ext/admin/notes.json', params: {
        note: {
            message: 'Hello everyone',
            noteable_type: 'Hotel',
            noteable_id: hotel.id
          }
        }

      expect(Note.count).to eq 1
      expect(response.body).to eq 'Success!'
    end

    it 'doesnt allow users without access' do
      hotel = create :hotel

      post '/ext/admin/notes.json', params: {
        note: {
            message: 'Hello everyone',
            noteable_type: 'Hotel',
            noteable_id: hotel.id
          }
        }

      expect(response.status).to eq 302
      expect(Note.count).to eq 0
    end
  end

  describe 'DELETE' do
    it 'destroy users note' do
      user = create(:admin)
      sign_in user
      note = create :note, user: user, object: create(:hotel)

      delete "/ext/admin/notes/#{note.id}.json"

      expect(response.body).to eq 'Success!'
      expect(Note.count).to eq 0
    end

    it 'doesnt allow users to delete others users notes' do
      user = create(:admin)
      note = create :note, object: create(:hotel)

      delete "/ext/admin/notes/#{note.id}.json"

      expect(Note.count).to eq 1
    end
  end
end
