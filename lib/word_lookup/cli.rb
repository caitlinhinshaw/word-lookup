class WordLookup::CLI
    def call
        puts "Welcome to Word Lookup!"
        puts "Enter a word to look up:"
        # get_user_word
        # get_details_for(word)
        list_detail_categories
        # get_user_details
        # list_details
    end

    def get_user_word
        word = gets.strip
    end

    def list_detail_categories
        detail_categories = ["Definition", "Synonyms", "Antonyms", "Similar Words", "Rhymes"]
        detail_categories.each_with_index do |category, index|
            puts "#{index+1}. #{category}"
        end
    end
end