class WordLookup::Word
    @@detail_categories = ["Definition", "Synonyms", "Antonyms", "Similar Words", "Rhymes"]
    
    def self.detail_categories
        @@detail_categories
    end
end