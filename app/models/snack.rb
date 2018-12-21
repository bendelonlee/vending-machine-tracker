class Snack < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :price

  has_many :snack_machines
  has_many :machines, through: :snack_machines
end
