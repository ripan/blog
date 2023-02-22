require "rails_helper"

RSpec.describe Like, type: :model do
  it{ is_expected.to validate_presence_of(:resource_type) }
  it{ is_expected.to validate_presence_of(:resource_id) }
  it{ is_expected.to validate_presence_of(:count) }

  describe "uniqueness" do
    before{ create :like }

    it{ is_expected.to validate_uniqueness_of(:resource_type).scoped_to(:resource_id) }
  end
end
