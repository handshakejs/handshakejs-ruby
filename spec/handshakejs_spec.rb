require 'spec_helper'

describe Handshakejs do
  describe "defaults" do
    before do
      Handshakejs.salt         = nil
    end

    it { Handshakejs.salt.should eq "salt_required" }
    it { Handshakejs::VERSION.should eq "0.0.2" }
    it { Handshakejs.iterations.should eq 1000 }
    it { Handshakejs.key_length.should eq 16 }
    it { Handshakejs.hash_function.should eq "sha1" }
  end

  describe "setting values" do
    let(:salt)     { "adf3434938492fjkdfj" }

    before do
      Handshakejs.salt     = salt
    end

    it { Handshakejs.salt.should eq salt }
  end

  describe "#validate" do
    let(:salt)  { "1234" }
    let(:email) { "scott@mailinator.com" }
    let(:hash)  { "852874208fc66f6c404b6150e2bf3fba" }

    before do
      Handshakejs.salt = salt
    end

    it "is valid against against a correct email, hash combination" do
      result = Handshakejs.validate({:email => email, :hash => hash})

      result.should be_true 
    end

    it "is invalid against against an incorrect email" do
      email   = "different@email.com"
      result  = Handshakejs.validate({:email => email, :hash => hash})

      result.should be_false 
    end

    it "is invalid against against an incorrect hash" do
      hash    = "differenthash"
      result  = Handshakejs.validate({:email => email, :hash => hash})

      result.should be_false 
    end

    it "is invalid against against a different salt" do
      Handshakejs.salt = "different"
      result  = Handshakejs.validate({:email => email, :hash => hash})

      result.should be_false 
    end
  end
end
