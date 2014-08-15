require './order'
require './physical_product'
require './book'

describe Order do
  describe 'payment' do

    let(:order) do
      Order.new(product)
    end

    context 'for a physical product' do
      let(:product) { PhysicalProduct.new }

      it 'generates a packing slip for shipping' do
        expect(product).to receive(:generate_packing_slip).exactly(1).times
        order.process!
      end

      it 'generates a commission payment to the agent' do
        expect(product).to receive(:generate_comission_payment).exactly(1).times
        order.process!
      end
    end

    context 'for a book' do
      let(:product) { Book.new }

      it 'creates a duplicate packing slip for the royalty department' do
        expect(product).to receive(:generate_packing_slip).exactly(1).times
        expect(product).to receive(:generate_packing_slip_for_royalty_department).exactly(1).times
        order.process!
      end

      it 'generates a commission payment to the agent'
    end

    context 'for a membership' do
      it 'activates the membership'
    end

    context 'for an upgrade to a membership' do
      it 'applies the upgrade'
    end

    context "for the video 'learning to ski'" do
      it "adds a free 'First Aid' video to the packing slip"
    end
  end
end
