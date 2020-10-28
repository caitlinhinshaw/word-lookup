class WordLookup::CLI
    attr_accessor :current_word, :current_definitions, :current_definition_index

    def call
        puts "\nWelcome to Word Lookup!"
        choose_word
    end

    def choose_word
        puts "\nEnter a word to look up:"
        word = gets.strip
        @current_word = WordLookup::Word.new(word)
        valid_word?
    end

    def valid_word?
        if @current_word.detail_hash["success"] == false
            puts "\nThe word '#{@current_word.word_text}' was not found. Please try again."
            choose_word
        else
            @current_word.add_details
            list_definitions
            list_detail_categories
        end
    end

    def list_definitions
        @current_definitions = @current_word.definitions
        puts "\nHere are the definition(s) for '#{current_word.word_text}':"
        @current_word.definitions.each_with_index do |definition, index|
            puts "#{index+1}. #{definition}"
        end
    end

    def list_detail_categories
        puts "\nWhat information would you like about this word? Enter a number."
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
            puts "this is NOT valid, please try again"
            choose_details
        end
    end

    def valid_choice?(input, array)
        input <= array.length && input > 0
    end

    def list_details(chosen_details)
        case chosen_details
        when 1
            puts "\nHere are the synonyms for '#{@current_word.word_text}':"
            print_detail_array(@current_word.synonyms)
        when 2
            if @current_word.antonyms.empty?
                puts "\nThe word '#{@current_word.word_text}' has no listed antonyms."
            else
                puts "\nHere are the antonyms for '#{@current_word.word_text}':"
                print_detail_array(@current_word.antonyms)
            end
        when 3
            puts "\nHere are the similar words for '#{@current_word.word_text}':"
            print_detail_array(@current_word.similar_words)
        when 4
            puts "\nHere are the rhymes for '#{@current_word.word_text}':"
            print_detail_array(@current_word.rhymes)
        end
        choose_next_action
    end

    def output_detail_results

    end

    def print_detail_array(array)
        array.each do |item|
            puts "- #{item}"
        end
    end

    def choose_next_action
        puts "\nWhat would you like to do?"
        puts "Enter 1 for more details on '#{@current_word.word_text}'."
        puts "Enter 2 to look up a new word."
        puts "Enter 3 to exit the program."
        next_action = gets.strip.to_i
        case next_action
        when 1
            list_detail_categories
        when 2
            choose_word
        when 3
            puts "Goodbye!"
            exit
        else
            puts "This is not a valid selection. Please try again."
            choose_next_action
        end
    end
end