class WordLookup::Word
    @@detail_categories = ["Definition", "Synonyms", "Antonyms", "Similar Words", "Rhymes"]
    
    @@all = []

    attr_accessor :word_text

    def initialize(word_text)
        @word_text = word_text
        fetch_details
        @@all << self
    end

    def fetch_details
        detail_hash = WordLookup::API.new.fetch_word_details_from_API(@word_text)
    end

    def self.all
        @@all
    end

    def self.detail_categories
        @@detail_categories
    end
end