class WordLookup::Word
    @@detail_categories = ["Definitions", "Synonyms", "Antonyms", "Similar Words", "Rhymes"]
    
    @@all = []

    attr_accessor :word_text, :detail_hash, :definitions, :synonyms, :antonyms, :similar_words, :rhymes

    def initialize(word_text)
        @word_text = word_text
        @detail_hash = WordLookup::API.new.fetch_word_details_from_API(@word_text)
        fetch_details
        fetch_rhymes
        @@all << self
    end

    def fetch_details
        fetch_definitions
        # fetch_synonyms
        # fetch_antonyms
        # fetch_similar_words
    end

    def fetch_rhymes
        rhymes_hash = WordLookup::API.new.fetch_rhymes_from_API(@word_text)
    end

    def fetch_definitions
        @definitions = []
        @detail_hash["results"].each do |meaning|
            @definitions << meaning["definition"]
        end
        @definitions
    end

    def self.all
        @@all
    end

    def self.detail_categories
        @@detail_categories
    end
end