# frozen_string_literal: true

require "rails_helper"

RSpec.describe Notification, type: :model do
  it "needs an user" do
    notification = build(:notification, user: nil)

    expect(notification.valid?).to eq(false)
  end

  it "needs a title" do
    notification = build(:notification, title: "")

    expect(notification.valid?).to eq(false)
  end

  it "created" do
    notification = build(:notification)

    expect(notification.valid?).to eq(true)
  end
end
