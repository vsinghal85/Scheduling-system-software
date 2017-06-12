class EventOccurrence < ActiveRecord::Base
  belongs_to :schedulable, polymorphic: true
  default_scope { order('date ASC') }
  scope :remaining, lambda{where(["date >= ?",Time.now])}
  scope :previous, lambda{where(["date < ?",Time.now])}
end
