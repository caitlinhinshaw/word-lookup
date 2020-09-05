class WordLookup::CLI
    def call
        puts "\nWelcome to Word Lookup!"
        get_chosen_word
        # get_details_for(word)
        list_detail_categories
        get_chosen_details
        # list_details
    end

    def get_chosen_word
        puts "\nEnter a word to look up:"
        word = gets.strip
    end

    def list_detail_categories
        puts "\nWhat information would you like about this word? Enter a number."
        puts "\n"
        detail_categories = ["Definition", "Synonyms", "Antonyms", "Similar Words", "Rhymes"]
        detail_categories.each_with_index do |category, index|
            puts "#{index+1}. #{category}"
        end
    end

    def get_chosen_details
        chosen_details = gets.strip.to_i
        #add validation of number
    end
end