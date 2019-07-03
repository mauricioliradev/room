class Event < ApplicationRecord
  belongs_to :user
  validates :description, presence: true

  def all_day_event?
    self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  end
end
