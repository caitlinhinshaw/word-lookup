class WordLookup::Word
    @@detail_categories = ["Synonyms", "Antonyms", "Similar Words", "Rhymes"]
    
    @@all = []

    attr_accessor :word_text, :detail_hash, :definitions, :synonyms, :antonyms, :similar_words, :rhymes

    def initialize(word_text)
        @word_text = word_text
        @detail_hash = WordLookup::API.new.fetch_word_details_from_API(@word_text)
        @@all << self
    end

    def add_details
        fetch_definitions
        fetch_synonyms
        # fetch_antonyms
        # fetch_similar_words
        fetch_rhymes
    end

    def fetch_definitions
        @definitions = []
        #binding.pry
        @detail_hash["results"].each do |meaning|
            @definitions << meaning["definition"]
        end
    end

    def fetch_synonyms
        @synonyms = []
        @detail_hash["results"].each do |meaning|
            @synonyms << meaning["synonyms"]
        end
    end

    def fetch_rhymes
        rhymes_hash = WordLookup::API.new.fetch_rhymes_from_API(@word_text)
    end

    def self.all
        @@all
    end

    def self.detail_categories
        @@detail_categories
    end
end