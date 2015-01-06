require "rails_helper"

RSpec.describe "Events", type: :request do
  describe "GET /" do
    it "works! (now write some real specs)" do
      get root_path
      expect(response.status).to be(200)
    end
  end
end
