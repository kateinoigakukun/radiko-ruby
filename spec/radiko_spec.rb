require "spec_helper"
require "radiko"

describe Radiko do
  it "has a version number" do
    expect(Radiko::VERSION).not_to be nil
  end

  it "create auth_token" do
    p Radiko::Authorize.new.auth_token
    expect(Radiko::Authorize.new.auth_token).not_to be nil
  end

  it "record" do
    Radiko::Client.new.record("QRR", 10, "/tmp/output.mp3")
  end

  it "download" do
    Radiko::Client.new.download("QRR", 20180312003000, 20180312010000, "/tmp/yui_20180312003000.mp3")
  end

end
