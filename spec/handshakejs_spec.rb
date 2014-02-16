require 'spec_helper'

describe Handshakejs do
  subject { Handshakejs }

  describe "defaults" do
    before do
      subject.salt         = nil
    end

    it { subject.salt.should eq "salt_required" }
    it { subject::VERSION.should eq "0.0.1" }
  end

  describe "setting values" do
    let(:salt)     { "adf3434938492fjkdfj" }

    before do
      subject.salt     = salt
    end

    it { subject.salt.should eq salt }
  end
end
