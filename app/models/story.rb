class Story < ApplicationRecord
  has_many :step_flows
  enum status: {
    pending: 0,
    active: 1,
    archived: 2
  }
  validates :title, :hero, :location, :enemy, :treasure, presence: true, if: :active?
end
