class String

  def pigatize
    pigatized_text = Array.new
    count = 0
    passed_text_array = self.split
    passed_text_array.collect do |passed_text|
      if starts_with_vowel(passed_text[0])
        pigatized_text[count] = passed_text + "way"
      else
        pigatized_text[count] = passed_text[1..-1] + passed_text[0].downcase + "ay"
      end
      count += 1
      end
      return pigatized_text.join(" ")
  end

  def starts_with_vowel(first_letter)
    return ["a", "e", "i", "o", "u"].include?(first_letter.downcase)
  end
end
