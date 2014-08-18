require 'pry'
require './order'
require './physical_product'
require './book'
require './membership'
require './video'

describe Order do
  describe 'payment' do

    let(:order) do
      Order.new(item, actions)
    end

    context 'for a physical product' do
      let(:item) { PhysicalProduct.new }

      let(:actions) do
        [:generate_packing_slip,
         :generate_comission_payment]
      end

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

      let(:actions) do
        [:generate_packing_slip,
        :generate_packing_slip_for_royalty_department,
        :generate_comission_payment]
      end

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

      let(:actions) { :activate_membership }

      it 'activates the membership' do
        expect(item.active?).to eq(false)
        order.process!
        expect(item.active?).to eq(true)
      end

      it 'sends an e-mail to the owner and inform of the activation' do
        expect(item.active?).to eq(false)
        expect(item).to receive(:notify_owner_for_activation).exactly(1).times
        order.process!
        expect(item.active?).to eq(true)
      end
    end

    context 'for an upgrade to a membership' do
      let(:item) { Membership.new }

      let(:actions) { :upgrade_membership }

      it 'applies the upgrade' do
        expect(item.plan).to eq(:free)
        order.process!
        expect(item.plan).to eq(:premium)
      end
    end

    context "for the video 'learning to ski'" do
      let(:item) { Video.new('Learning to Ski', 45.0) }
      let(:actions) { :add }

      it "adds a free 'First Aid' video to the packing slip" do
        expect(item).to receive(:add_free_videos).exactly(1).times
        order.process!
      end
    end
  end
end
