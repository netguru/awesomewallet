class User
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :balance, type: Integer
  attr_accessible :name, :email
  has_many :identities
  validates_presence_of :name
  # run 'rake db:mongoid:create_indexes' to create indexes
  index({ email: 1 }, { unique: true, background: true })

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
