require "handshakejs/version"

module Handshakejs
  extend self

  def salt=(salt)
    @salt = salt

    @salt
  end

  def salt
    return @salt if @salt
    "salt_required"
  end
end
