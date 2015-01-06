require "rails_helper"

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events_by_date,
      FactoryGirl.attributes_for(:event)[:start_date].to_date =>
      [
        FactoryGirl.create(:event),
        FactoryGirl.create(:event)
      ]
    )
  end

  it "renders a list of events" do
    render
  end
end
