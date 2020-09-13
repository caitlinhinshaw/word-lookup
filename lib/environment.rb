require_relative "./word_lookup/version"
require_relative "./word_lookup/cli"
require_relative "./word_lookup/word"
require_relative "./word_lookup/api"

require 'pry'
require 'json'
require 'uri'
require 'net/http'
require 'openssl'

module WordLookup
  class Error < StandardError; end
  # Your code goes here...
end
