require "armor"
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

  def hash_function=(hash_function)
    @hash_function = hash_function

    @hash_function
  end

  def hash_function
    return @hash_function if @hash_function
    "sha1"
  end

  def digest
    Armor::Digest.new(hash_function)
  end

  def validate(params={})
    password  = params[:email]

    result    = Armor.hex(Armor.pbkdf2(digest, password, salt, Integer(iterations), key_length))

    params[:hash] == result
  end
end
