require 'rails_helper'

RSpec.describe Airport, type: :model do
  subject { described_class.new }

  context 'with correct params' do
    it 'creates a valid object' do
      subject.name    = 'Aeropuerto Roberto Fierro'
      subject.iata    = 'CUU'
      subject.city    = 'Chihuahua'
      subject.country = 'Mexico'

      expect(subject).to be_valid
    end
  end
end
