# frozen_string_literal: true

class ShopController < ApplicationController
  def offer
    p = offer_params

    notified_users = []
    User.all.each do |user|
      notification = user.notifications.new(
        title: "Promoção!",
        message: p[:offer_description],
        data: {
          shop_id: params[:shop_id]
        }
      )

      if notification.save
        notified_users.push user.id
      end
    end

    render json: { notified_users: }
  end

  private
    def offer_params
      params.permit :shop_id, :offer_description
    end
end
