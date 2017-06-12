class Event < ApplicationRecord
	acts_as_schedulable :schedule, occurrences: :event_occurrences
  validates :title, presence: true
  attr_accessor :date_range

  def all_day_event?
    self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  end

  belongs_to :client
end
