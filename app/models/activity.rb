class Activity < ApplicationRecord
  belongs_to :user
  enum name: [:Running, :Yoga, :HIIT, :Cycling, :Weight_Training, :Swimming, :Hiking, :Jogging, :Pilates, :Dancing, :other]
  validates :name, presence: true
  validates :duration_minutes, presence: true
  validates :date_field, presence: true


end
