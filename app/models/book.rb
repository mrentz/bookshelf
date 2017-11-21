class Book < ApplicationRecord
  has_many :comments, inverse_of: :book 
  belongs_to :admin, inverse_of: :books 
  accepts_nested_attributes_for :admin, :comments, allow_destroy: true
  validates_presence_of :admin
end
