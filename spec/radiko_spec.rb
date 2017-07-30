require "spec_helper"
require "radiko"

describe Radiko do
  it "has a version number" do
    expect(Radiko::VERSION).not_to be nil
  end

  it "create auth_token" do
    expect(Radiko::Authorize.new.auth_token).not_to be nil
  end

  it "record" do
    Radiko::Client.new.record("QRR", 10, "/tmp/output.mp3")
  end

end
