class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :purchases, foreign_key: 'author_id'
  has_many :categories

  validates :full_name, presence: true, format: { with: /\A[a-zA-Z]+(?:\s[a-zA-Z]+)?\z/, message: 'Must contain at least two words' }
end
