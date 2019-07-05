require 'rails_helper'
RSpec.describe "Events", type: :request do
  describe "GET /events" do
    it "return status 302" do
      get events_path
      expect(response).to have_http_status(302)
    end    
  end

  describe "POST /events" do
    it "create valid event" do
      number_of_events = Event.count
      Event.create!(user_id: 1, description: Faker::Book.title, start: "2019-08-25 17:00:00 -0300".to_time, end: "2019-08-25 17:30:00 -0300".to_time, color: ['black','green','red', nil].sample)
      expect(Event.count).to eq (number_of_events + 1)
    end 
  end

  describe 'Delete product' do
    it 'Gets a 204 (no content) http response' do
      event = Event.last
      delete "/events/#{event.id}"
      expect(response).to have_http_status(302)
    end
  end
end
