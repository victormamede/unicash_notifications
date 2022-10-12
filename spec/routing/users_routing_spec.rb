# frozen_string_literal: true

require "rails_helper"

RSpec.describe UsersController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "/users").to route_to("users#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/users/1").to route_to("users#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/users/1").to route_to("users#destroy", id: "1")
    end
  end
end
