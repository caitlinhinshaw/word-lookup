class WordLookup::Word
    @@detail_categories = ["Definition", "Synonyms", "Antonyms", "Similar Words", "Rhymes"]
    
    @@all = []

    attr_accessor :word_text

    def initialize(word_text)
        @word_text = word_text
        fetch_details(word_text)
        @@all << self
    end

    def fetch_details(word_text)

    end

    def self.all
        @@all
    end

    def self.detail_categories
        @@detail_categories
    end
end