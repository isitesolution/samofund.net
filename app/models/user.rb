class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :timeoutable, :encryptable, :stretches => 20

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :state, :full_name

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  # Predicate to know what kind of user this is
  %w(Client Employee Admin).each do |type|
    define_method "#{type.downcase}?" do
      self.class.to_s == type
    end
  end

  # For primary navigation at application.html.haml
  def to_nav
    type.downcase
  end
end