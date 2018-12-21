class Machine < ApplicationRecord
  validates_presence_of :location

  belongs_to :owner

  has_many :snack_machines
  has_many :snacks, through: :snack_machines

  def average_price
    Snack.joins(:machines).where("snack_machines.machine_id = ?", "#{self.id}").average(:price)
  end

  def unique_snacks
    snacks.count
  end
end
