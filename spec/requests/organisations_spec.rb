require 'rails_helper'

RSpec.describe "OrganisationsController", type: :request do
  current_agent = Agent.first_or_create!(name: 'Revanth', role_id: 5, report_to: 4,
    email: "r@gmail.com", password: "reva123", password_confirmation: "reva123")
  org = Organisation.first_or_create!(name: 'Microsoft', price: 75000)

  describe "GET / Organisations" do
    it "index works!" do
      get organisations_path
      expect(response).to have_http_status(200)
    end

    it "show works!" do
      get organisation_path(id: org.id)
      expect(response).to have_http_status(200)
    end

    it "premium_orgs works!" do
      get premium_orgs_path
      expect(response).to have_http_status(200)
    end
  end

  describe "After Login" do

    it "new works!" do
      get new_organisation_path
      assert_response :redirect
    end

    it "edit works!" do
      get edit_organisation_path(id: org.id)
      assert_response :redirect
    end

  end
end
