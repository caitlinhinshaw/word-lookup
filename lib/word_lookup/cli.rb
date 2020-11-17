class WordLookup::CLI
    attr_accessor :current_word

    def call
        puts "\nWelcome to Word Lookup!".colorize(:light_cyan)
        choose_word
    end

    def choose_word
        puts "\nEnter a word to look up:".colorize(:light_green)
        word = gets.strip
        @current_word = WordLookup::Word.new(word)
        validate_word
    end

    def validate_word
        if @current_word.detail_hash["success"] == false
            puts "\nThe word '#{@current_word.word_text}' was not found. Please try again.".colorize(:light_red)
            choose_word
        else
            @current_word.add_details
            list_definitions
        end
    end

    def list_definitions
        puts "\nHere are the definition(s) for '#{current_word.word_text}':".colorize(:light_blue)
        @current_word.definitions.each_with_index do |definition, index|
            puts "#{index+1}. #{definition}"
        end
        list_detail_categories
    end

    def list_detail_categories
        puts "\nWhat information would you like about the word '#{current_word.word_text}'? Enter a number.".colorize(:light_green)
        puts "\n"
        WordLookup::Word.detail_categories.each_with_index do |category, index|
            puts "#{index+1}. #{category}"
        end
        choose_details
    end

    def choose_details
        chosen_details = gets.strip.to_i
        if valid_choice?(chosen_details, WordLookup::Word.detail_categories)
            list_details(chosen_details)
        else
            puts "This is not a valid choice. Please try again.".colorize(:light_red)
            choose_details
        end
    end

    def valid_choice?(input, array)
        input.between?(1, array.length)
    end

    def list_details(chosen_details)
        case chosen_details
        when 1
            output_detail_results(@current_word.synonyms, "synonyms")
        when 2
            output_detail_results(@current_word.antonyms, "antonyms")
        when 3
            output_detail_results(@current_word.similar_words, "similar words")
        when 4
            output_detail_results(@current_word.rhymes, "rhymes")
        end
        choose_next_action
    end

    def output_detail_results(word_details_array, word_details)
        if word_details_array.empty?
            puts "\nThe word '#{@current_word.word_text}' has no listed #{word_details}.".colorize(:light_blue)
        else
            puts "\nHere are the #{word_details} for '#{@current_word.word_text}':".colorize(:light_blue)
            print_detail_array(word_details_array)
        end
    end

    def print_detail_array(array)
        array.each do |item|
            puts "- #{item}"
        end
    end

    def choose_next_action
        puts "\nWhat would you like to do?".colorize(:light_green)
        puts "\nEnter 1 for more details on '#{@current_word.word_text}'."
        puts "Enter 2 to look up a new word."
        puts "Enter 3 to exit the program."
        next_action = gets.strip.to_i
        case next_action
        when 1
            list_detail_categories
        when 2
            choose_word
        when 3
            puts "\nGoodbye!".colorize(:light_cyan)
            puts "\n"
            exit
        else
            puts "This is not a valid selection. Please try again.".colorize(:light_red)
            choose_next_action
        end
    end
end