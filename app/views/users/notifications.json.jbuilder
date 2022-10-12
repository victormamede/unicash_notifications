# frozen_string_literal: true

json.array! @user.notifications, partial: "notifications/notification", as: :notification
