require 'rails_helper'

RSpec.describe Municipe, type: :model do
  describe "associations" do
    it { should have_many(:municipe_addresses).class_name('MunicipeAddress') }
  end

  describe "Validations" do
    subject { build(:municipe, cpf: '47263578085', cns: '109386679800002') }

    it { should validate_presence_of(:full_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:birth_date) }
    it { should validate_presence_of(:telephone) }
    it { should validate_presence_of(:ddi) }
    it { should validate_presence_of(:cpf) }
    it { should validate_presence_of(:cns) }
    it { should validate_presence_of(:photo) }

    it { should allow_value('om30@om30.com').for(:email) }
    it { should_not allow_value('om30.com').for(:email) }
    it { should_not allow_value('om30').for(:email) }

    it "validates uniqueness of cpf" do
      create(:municipe, cpf: '47263578085')
      is_expected.to validate_uniqueness_of(:cpf).case_insensitive
    end

    it "validates uniqueness of cns" do
      create(:municipe, cpf: Faker::CPF.numeric, cns: '109386679800002')
      is_expected.to validate_uniqueness_of(:cns).case_insensitive
    end

    it "is valid with a valid CPF" do
      municipe = build(:municipe)
      expect(municipe).to be_valid
    end

    it "is invalid with an invalid CPF" do
      municipe = build(:municipe, cpf: '123.456.789-10')
      municipe.valid?
      expect(municipe.errors[:cpf]).to include("CPF inválido")
    end

    it 'executes set_status callback before creation' do
      municipe = build(:municipe)
      expect(municipe).to receive(:set_status)
      municipe.save
    end
  end
end
