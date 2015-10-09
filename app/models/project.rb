class Project < ActiveRecord::Base
  belongs_to :owner, foreign_key: :owner_id, class_name: :User
  has_many :fundings, class_name: :Funding
  validates :name, presence: true, length: { maximum: 50 }
  validates :target_amount, numericality: { only_integer: true,
                                            allow_blank: true,
                                            greater_than: 0 }

  def current_amount
    fundings.sum(:amount)
  end
end
