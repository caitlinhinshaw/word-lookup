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
        #This method assigns values to the attributes based on the detail hash from the API.
        #It's not called until the word is validated in the CLI to avoid errors from trying to
        #iterate through non-existent hashes.
        add_definitions
        add_synonyms
        add_antonyms
        add_similar_words
        add_rhymes
    end

    def add_definitions
        @definitions = @detail_hash["results"].collect do |meaning|
            meaning["definition"]
        end
    end

    def add_synonyms
        @synonyms = []
        @detail_hash["results"].each do |meaning| #collects the synonyms for each meaning to display all at once
            @synonyms << meaning["synonyms"]
            @synonyms << meaning["also"]
        end
        @synonyms = flatten_and_remove_nils(@synonyms)
    end

    def add_antonyms
        @antonyms = @detail_hash["results"].collect do |meaning|
            meaning["antonyms"]
        end
        @antonyms = flatten_and_remove_nils(@antonyms)
    end

    def add_similar_words
        @similar_words = @detail_hash["results"].collect do |meaning|
            meaning["similarTo"]
        end
        @similar_words = flatten_and_remove_nils(@similar_words)
    end

    def add_rhymes
        rhyme_hash = WordLookup::API.new.fetch_rhymes_from_API(@word_text)
        @rhymes = rhyme_hash["rhymes"]["all"]
    end

    def flatten_and_remove_nils(array)
        flat_array = array.flatten.uniq
        flat_array.compact unless array.none? {|a| a.nil?}
        #returns a flattened array with no nils or duplicate values
        #unless statement is necessary because array.compact returns nil if
        #there are no nil values, and we want it to return the array instead
    end

    def self.all
        @@all
    end

    def self.detail_categories
        @@detail_categories
    end
end