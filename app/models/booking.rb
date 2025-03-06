class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :deck

validates :date_of_beginning, presence: true
validates :date_of_end, presence: true
validate :date_of_end_after_date_of_beginning

private

def date_of_end_after_date_of_beginning
  return if date_of_end.blank? || date_of_beginning.blank?

  if date_of_end < date_of_beginning
    errors.add(:date_of_end, "must be after the start date")
  end
end
end
