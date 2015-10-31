class Funding < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  validates :amount,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than: 0,
              less_than: 100_000
            }
end
