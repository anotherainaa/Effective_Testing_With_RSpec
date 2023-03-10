RSpec.describe BerlinTransitTicket do
  let(:ticket) { BerlinTransitTicket.new }

  before do
    # These values depend on `let` definitions
    # defined in the nested contexts below
    ticket.starting_station = starting_station
    ticket.ending_station = ending_station
  end

  let(:fare) { ticket.fare }

  context 'when startng in zone A' do
    let(:starting_station) { 'Bundestag' }

    context 'and ending in zone B' do
      let(:ending_station) { 'Leopoldlatz' }
      
      it 'costs $2.70' do
        expect(fare).to eq 2.7
      end
    end

    context 'and ending in zone C' do
      let(:ending_station) { 'Birkenwerder' }
  
      it 'costs $3.30' do
        expect(fare).to eq 3.3
      end
    end
  end
end