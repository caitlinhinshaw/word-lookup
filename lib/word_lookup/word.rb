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
        fetch_antonyms
        fetch_similar_words
        fetch_rhymes
    end

    def fetch_definitions
        @definitions = []
        @detail_hash["results"].each do |meaning|
            @definitions << meaning["definition"]
        end
    end

    def fetch_synonyms
        @synonyms = []
        @detail_hash["results"].each do |meaning| #collects the synonyms for each meaning to display all at once
            @synonyms << meaning["synonyms"]
            @synonyms << meaning["also"]
        end
        @synonyms = flatten_and_remove_nils(@synonyms)
    end

    def fetch_antonyms
        @antonyms = []
        @detail_hash["results"].each do |meaning|
            @antonyms << meaning["antonyms"]
        end
        @antonyms = flatten_and_remove_nils(@antonyms)
    end

    def fetch_similar_words
        @similar_words = []
        @detail_hash["results"].each do |meaning|
            @similar_words << meaning["similarTo"]
        end
        @similar_words = flatten_and_remove_nils(@similar_words)
    end

    def fetch_rhymes
        rhyme_hash = WordLookup::API.new.fetch_rhymes_from_API(@word_text)
        @rhymes = rhyme_hash["rhymes"]["all"]
    end

    def flatten_and_remove_nils(array)
        flat_array = array.flatten.uniq
        flat_array.compact unless array.none? {|a| a.nil?}
    end

    def self.all
        @@all
    end

    def self.detail_categories
        @@detail_categories
    end
end