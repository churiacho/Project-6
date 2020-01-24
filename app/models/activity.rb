class Activity < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :duration_minutes, presence: true
  validates :date_field, presence: true
end
