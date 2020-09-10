require_relative "./word_lookup/version"
require_relative "./word_lookup/cli"
require_relative "./word_lookup/word"

require 'pry'
require 'json'
require 'httparty'

module WordLookup
  class Error < StandardError; end
  # Your code goes here...
end
