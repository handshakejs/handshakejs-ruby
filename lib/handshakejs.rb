require "pbkdf2"
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

  def iterations=(iterations)
    @iterations = iterations

    @iterations
  end

  def iterations
    return @iterations if @iterations
    1000
  end

  def key_length=(key_length)
    @key_length = key_length

    @key_length
  end

  def key_length
    return @key_length if @key_length
    16
  end

  def validate(params={})
    pbkdf2 = PBKDF2.new do |p| 
      p.password      = params[:email] 
      p.salt          = Handshakejs.salt 
      p.iterations    = Handshakejs.iterations
      p.key_length    = Handshakejs.key_length
      p.hash_function = "sha1"
    end

    params[:hash] == pbkdf2.hex_string 
  end
end
