class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects, foreign_key: :owner_id
  has_many :fundings
  validates :name, presence: true, length: { maximum: 30 },
                   uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }

  def total_funding
    fundings.sum(:amount)
  end
end
