# frozen_string_literal: true

require "swagger_helper"

RSpec.describe "shop", type: :request do
  let!(:user) { create(:user) }
  generate_responses!

  path "/shop/offer" do
    post("shop offer") do
      tags "Shop"
      consumes "application/json"
      produces "application/json"
      parameter name: :data, in: :body, schema: {
        type: :object,
        properties: {
          shop_id: { type: :number },
          shop_name: { type: :string },
          offer_description: { type: :string }
        },
      }

      response(200, "successful") do
        let!(:users) { create_list(:user, 10) }
        let(:data) { {
          shop_id: 5,
          shop_name: "Lanches da Uni",
          offer_description: "Desconto de 20% no cafézinho"
        } }

        run_test! do
          notification = Notification.last
          expect(notification.data["shop_id"]).to eq(5)

          users.each do |user|
            user.reload
            expect(user.notifications.count).to eq(1)
          end
        end
      end
    end
  end
end
