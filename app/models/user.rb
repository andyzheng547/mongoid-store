class User
  # Attributes
  include Mongoid::Document
  field :first_name,  type: String
  field :last_name,   type: String
  field :email,       type: String

  # Validations
  validates_presence_of :first_name, :last_name

  embeds_many :addresses
end
