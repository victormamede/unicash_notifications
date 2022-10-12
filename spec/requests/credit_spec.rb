# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Credits", type: :request do
  let!(:user1) { create(:user) }
  let!(:user2) { create(:user) }
  generate_responses!

  path "/credit/transfer" do
    post("credit transfer") do
      tags "Credit"
      consumes "application/json"
      produces "application/json"
      parameter name: :data, in: :body, schema: {
        type: :object,
        properties: {
          sender_id: { type: :number },
          recipient_id: { type: :number },
          amount: { type: :number }
        },
      }

      response(200, "successful") do
        let(:data) { {
          sender_id: user1.id,
          recipient_id: user2.id,
          amount: 500
        } }

        run_test! do
          notification = Notification.last
          expect(notification.data["recipient_id"]).to eq(user2.id)
          expect(Notification.all.count).to eq(2)
        end
      end
    end
  end
end
