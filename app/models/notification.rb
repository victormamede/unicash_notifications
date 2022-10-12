# frozen_string_literal: true

class Notification < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
end
