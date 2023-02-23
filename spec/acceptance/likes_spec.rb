require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Likes" do
  header "Content-Type", "application/json"

  post "api/v1/likes" do
    with_options scope: :like, required: true do
      parameter :resource_type, "Resource Type"
      parameter :resource_id, "Resource Id"
    end

    let(:resource_type){ "Article" }
    let(:resource_id){ 23 }

    context "201" do
      example "Create Likes", document: :v1 do
        do_request

        expect(status).to eq 201
        expect(Like.count).to eq 1
      end
    end

    context "422" do
      let(:resource_type){ nil }
      let(:resource_id){ nil }
      example "Create Likes - error", document: :v1 do
        do_request

        expect(status).to eq 422
        expect(Like.count).to eq 0
      end
    end
  end
end
