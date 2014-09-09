require 'rails_helper'

RSpec.describe Event, :type => :model do
  it "has a factory" do
    expect(FactoryGirl.create(:event)).to be_valid
  end
  it { should validate_presence_of :title }
  it { should validate_presence_of :url }
  it { should validate_presence_of :location }
  it { should validate_presence_of :start }
  it { should validate_presence_of :title }
end
