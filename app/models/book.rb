class Book < ApplicationRecord
  has_many :comments
  accepts_nested_attributes_for :comments
end
