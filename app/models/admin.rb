class Admin < ApplicationRecord
  has_many :books, :inverse_of => :admin
  accepts_nested_attributes_for :books
  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::Sha512
  end
end
 
