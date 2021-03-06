class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  after_commit :assign_customer_id, on: :create

	extend FriendlyId
	friendly_id :full_name, use: :slugged

  validates_presence_of :email, :address, :favorite_word
  validates_presence_of :favorite_word, message: "Du skal vælge et yndlingsord! Der er så mange gode."

  has_many :favorites, inverse_of: :user
  has_many :credit_cards, dependent: :destroy


  def assign_customer_id # For Stripe - saving users to their platform
    customer = Stripe::Customer.create(email: email)
    self.customer_id = customer.id
  end

end
