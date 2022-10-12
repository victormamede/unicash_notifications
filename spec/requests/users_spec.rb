# frozen_string_literal: true

require "swagger_helper"

RSpec.describe "users", type: :request do
  let!(:user) { create(:user) }
  let!(:users) { create_list(:user, 10) }
  generate_responses!

  path "/users" do
    post("create user") do
      tags "Users"
      consumes "application/json"
      produces "application/json"
      parameter name: :data, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          matricula: { type: :string },
        },
      }

      response 201, "successful" do
        let(:data) { attributes_for(:user) }
        run_test!
      end
    end
  end

  path "/users/{id}" do
    parameter name: "id", in: :path, type: :string, description: "id"
    let(:id) { user.id }

    put("update user") do
      tags "Users"
      consumes "application/json"
      produces "application/json"
      parameter name: :data, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          matricula: { type: :string },
        },
      }

      response 200, "successful" do
        let(:data) { attributes_for(:user) }
        run_test!
      end
    end

    delete("delete user") do
      tags "Users"
      produces "application/json"

      response 204, "successful" do
        run_test!
      end
    end
  end

  path "/users/{id}/notifications" do
    parameter name: "id", in: :path, type: :string, description: "id"
    let(:id) { user.id }

    get("user login") do
      tags "Users", "Notifications"
      produces "application/json"

      response 200, "successful" do
        let!(:notifications) { create_list(:notification, 5, user:) }
        run_test!
      end
    end
  end

  path "/users/{id}/login" do
    parameter name: "id", in: :path, type: :string, description: "id"
    let(:id) { user.id }

    post("user login") do
      tags "Users"
      consumes "application/json"
      produces "application/json"
      parameter name: :data, in: :body, schema: {
        type: :object,
        properties: {
          device_token: { type: :string },
        },
      }

      response 200, "successful" do
        let(:data) { { device_token: "123123" } }
        run_test!
      end
    end
  end
end
