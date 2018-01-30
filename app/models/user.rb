class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :post
  has_many :comment

  def fullname
    "#{first_name} #{last_name}"
  end

validates :first_name, :last_name, :email, presence: true


end
