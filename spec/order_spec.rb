require 'pry'
require './order'
require './physical_product'
require './book'
require './membership'

describe Order do
  describe 'payment' do

    let(:order) do
      Order.new(item)
    end

    context 'for a physical product' do
      let(:item) { PhysicalProduct.new }

      it 'generates a packing slip for shipping' do
        expect(item).to receive(:generate_packing_slip).exactly(1).times
        order.process!
      end

      it 'generates a commission payment to the agent' do
        expect(item).to receive(:generate_comission_payment).exactly(1).times
        order.process!
      end
    end

    context 'for a book' do
      let(:item) { Book.new }

      it 'creates a duplicate packing slip for the royalty department' do
        expect(item).to receive(:generate_packing_slip).exactly(1).times
        expect(item).to receive(:generate_packing_slip_for_royalty_department).exactly(1).times
        order.process!
      end

      it 'generates a commission payment to the agent' do
        expect(item).to receive(:generate_comission_payment).exactly(1).times
        order.process!
      end
    end

    context 'for a membership' do
      let(:item) { Membership.new }

      it 'activates the membership' do
        expect(item.active?).to eq(false)
        order.process!
        expect(item.active?).to eq(true)
      end
    end

    context 'for an upgrade to a membership' do
      it 'applies the upgrade'
    end

    context "for the video 'learning to ski'" do
      it "adds a free 'First Aid' video to the packing slip"
    end
  end
end
