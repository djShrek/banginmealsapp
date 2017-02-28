class Meal < ApplicationRecord

  attr_accessor :image

  has_many :order_meals

  mount_uploaders :images, ImageUploader

  scope :active_meals, -> { where(status: "active") }
  scope :clean_meals, -> { active_meals.where(type: "CleanMeal") }
  scope :specialty_meals, -> { active_meals.where(type: "SpecialtyMeal") }

  validates :name, presence: true
  validates :description, presence: true

  private

  def ensure_not_referenced_by_any_line_item
  end

end
