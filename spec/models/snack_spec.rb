require 'rails_helper'

describe Snack, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
    it { should have_many :machines }
    it { should have_many :snack_machines }
  end
end
