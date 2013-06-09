class User
  include Mongoid::Document

  field :name, type: String
  field :email, type: String
  field :balance, type: BigDecimal, default: 0
  index({ email: 1 }, { unique: true, background: true })
  # run 'rake db:mongoid:create_indexes' to create indexes

  has_many :identities
  has_many :transactions

  validates_presence_of :name

  attr_accessible :name, :email

  def self.create_with_omniauth(auth)
    user = User.where(email: auth['info']['email']).first
    return user if user.present?
    create! do |user|
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
      end
    end
  end

end
