require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource "Articles" do
  get "api/v1/articles" do
    example "Listing Articles" do
      do_request

      expect(status).to eq 200
    end
  end
end
