require 'rails_helper'

RSpec.describe MunicipeAddress, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:municipe).class_name('Municipe') }
  end

  describe "Validations" do
    it { should validate_presence_of(:street) }
    it { should validate_presence_of(:street_number) }
    it { should validate_presence_of(:neighborhood) }
    it { should validate_presence_of(:cep) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }

    it "is valid with valid attributes" do
      municipe_address = build(:municipe_address)
      expect(municipe_address).to be_valid
    end
    it "is invalid with invalid attributes" do
      municipe_address = build(:municipe_address, street: nil)
      expect(municipe_address).to be_invalid
    end
  end
end
