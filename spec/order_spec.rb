require './order'

describe Order do
  describe 'payment' do
    context 'for a physical product' do
      it 'generates a packing slip for shipping'
      it 'generates a commission payment to the agent'
    end

    context 'for a book' do
      it 'creates a duplicate packing slip for the royalty dept.'
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
