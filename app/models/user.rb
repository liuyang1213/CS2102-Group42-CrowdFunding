class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :projects, foreign_key: :owner_id
	validates :name, presence: true, length: { maximum: 50 },
				    uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 6 }
end
