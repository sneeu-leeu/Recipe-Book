class User < ApplicationRecord
  after_create :set_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { minimum: 3 }
  has_many :foods, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :inventories, dependent: :destroy

  def set_role
    update(role: 'user')
  end
end
