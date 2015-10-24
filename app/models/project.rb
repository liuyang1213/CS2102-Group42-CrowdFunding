class Project < ActiveRecord::Base
  belongs_to :owner, foreign_key: :owner_id, class_name: :User
  has_many :fundings, class_name: :Funding
  has_many :funders, class_name: :User, through: :fundings, source: :user
  validates :name, presence: true, length: { maximum: 50 }
  validates :target_amount,
            presence: true,
            numericality: {
              only_integer: true,
              allow_blank: true,
              greater_than: 0
            }
  validates :deadline, presence: true

  scope :order_by_date, (lambda do
    order('created_at desc')
  end)

  def uniq_funders
    funders.uniq
  end

  def current_amount
    fundings.sum(:amount)
  end

  def open?
    Time.new < deadline
  end
end
