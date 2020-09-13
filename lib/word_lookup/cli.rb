class WordLookup::CLI
    attr_accessor :current_word, :current_definitions, :current_definition_index

    def call
        puts "\nWelcome to Word Lookup!"
        choose_word
        choose_definition
        #list_detail_categories
        choose_details
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
        end
    end

    def list_definitions
        @current_definitions = @current_word.definitions
        puts "\nHere are the definition(s) for '#{current_word.word_text}':"
        @current_word.definitions.each_with_index do |definition, index|
            puts "#{index+1}. #{definition}"
        end
    end
    
    def choose_definition
        puts "\nWhich definition would you like more info on?"
        puts "Enter the corresponding number."
        definition_number = gets.strip.to_i
        if valid_choice?(definition_number, @current_definitions)
            @current_definition_index = definition_number - 1
            puts "\nYou chose the definition: '#{@current_definitions[@current_definition_index]}'"
            list_detail_categories
        else
            puts "\nThat number is not valid! Please try again."
            choose_definition
        end
    end

    def list_detail_categories
        puts "\nWhat information would you like about this word? Enter a number."
        puts "\n"
        WordLookup::Word.detail_categories.each_with_index do |category, index|
            puts "#{index+1}. #{category}"
        end
    end

    def choose_details
        chosen_details = gets.strip.to_i
        if valid_choice?(chosen_details, WordLookup::Word.detail_categories)
            puts "this is valid"
            # list_details(chosen_details)
            pp @current_word.detail_hash
        else
            puts "this is NOT valid, please try again"
            choose_details
        end
    end

    def valid_choice?(input, array)
        input <= array.length && input > 0
    end

    def list_details(chosen_details)

    end
end