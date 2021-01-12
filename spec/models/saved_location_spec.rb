require 'rails_helper'

RSpec.describe SavedLocation, :type => :model do
  subject {
    described_class.new(name: "Las Vegas", zip_code: "89117")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a zip code" do
    subject.zip_code = nil
    expect(subject).to_not be_valid
  end
end
