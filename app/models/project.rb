class Project < ActiveRecord::Base
	belongs_to :owner, foreign_key: :owner_id, class_name: :User
	validates :name, presence: true, length: { maximum: 50 }
	validates :target_amount, numericality: { only_integer: true, allow_blank: true }
end
