RSpec.describe WordLookup::Word do
    it "has detail categories" do
        expect(WordLookup::Word.detail_categories).to be_an_instance_of(Array)
    end
    it "has an All array" do
        expect(WordLookup::Word.all).to be_an_instance_of(Array)
    end
    it "adds an instance to the All array when the instance is initialized" do
        elephant = WordLookup::Word.new("elephant")
        expect(WordLookup::Word.all).to include(elephant)
    end
end