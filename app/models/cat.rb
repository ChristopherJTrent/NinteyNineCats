class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  CAT_COLORS = %w(brown black orange white)
  SEX = %w(M F)
  validates :birth_date, presence: true
  validate  :birth_date_cannot_be_future
  validates :color, presence: true, inclusion: {in: CAT_COLORS}
  validates :name, presence: true
  validates :sex, presence: true, inclusion: {in: SEX}

  has_many :cat_rental_requests,
    dependent: :destroy

  def birth_date_cannot_be_future
    return unless birth_date
    unless birth_date < Date.today
      errors.add(:birth_date, "cannot be in the future")
    end
  end
  def age
    time_ago_in_words(birth_date)
  end
end
