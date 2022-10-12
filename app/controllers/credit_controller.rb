# frozen_string_literal: true

class CreditController < ApplicationController
  def transfer
    p = transfer_params

    data = {
      sender_id: p[:sender_id],
      recipient_id: p[:recipient_id]
    }

    sender = User.find(p[:sender_id])
    recipient = User.find(p[:recipient_id])

    recipient.notifications.create!(title: "Você recebeu uma transferência!",
      message: "Você recebeu uma transferência de #{p[:amount]} créditos de #{sender.name}",
      data:)

    sender.notifications.create!(title: "Você enviou uma transferência!",
      message: "Você enviou #{p[:amount]} créditos para #{recipient.name}",
      data:)

    render json: { status: "success" }
  end

  private
    def transfer_params
      params.permit :sender_id, :recipient_id, :amount
    end
end
