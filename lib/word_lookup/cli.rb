class WordLookup::CLI
    @@detail_categories = ["Definition", "Synonyms", "Antonyms", "Similar Words", "Rhymes"]
    
    def call
        puts "\nWelcome to Word Lookup!"
        get_chosen_word
        # valid_word?
        # get_details_for(word)
        list_detail_categories
        get_chosen_details
        # list_details(chosen_details)
    end

    def detail_categories
        @@detail_categories
    end

    def get_chosen_word
        puts "\nEnter a word to look up:"
        word = gets.strip
    end

    def list_detail_categories
        puts "\nWhat information would you like about this word? Enter a number."
        puts "\n"
        detail_categories.each_with_index do |category, index|
            puts "#{index+1}. #{category}"
        end
    end

    def get_chosen_details
        chosen_details = gets.strip.to_i
        if valid_details?(chosen_details)
            puts "this is valid"
            # list_details(chosen_details)
        else
            puts "this is NOT valid, please try again"
            get_chosen_details
        end
    end

    def valid_details?(input)
        input <= detail_categories.length && input > 0
    end

    def list_details(chosen_details)

    end
end