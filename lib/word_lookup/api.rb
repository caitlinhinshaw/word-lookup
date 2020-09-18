class WordLookup::API
    def API_call(url)
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-host"] = 'wordsapiv1.p.rapidapi.com'
        request["x-rapidapi-key"] = ENV['WORDS_API_KEY']
        
        response = http.request(request)
    end

    def fetch_word_details_from_API(word)
        url = URI("https://wordsapiv1.p.rapidapi.com/words/#{word}/")

        json = API_call(url)

        convert_json_to_ruby(json)
    end

    def fetch_rhymes_from_API(word)
        url = URI("https://wordsapiv1.p.rapidapi.com/words/#{word}/rhymes")

        json = API_call(url)

        convert_json_to_ruby(json)
    end

    def convert_json_to_ruby(json)
        JSON.parse(json.body)
    end
end