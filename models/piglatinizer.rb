class PigLatinizer

  def is_a_vowel?(letter)
    vowels = %w(a e i o u A E I O U)
    vowels.include?(letter)
  end

  def piglatinize(text)
    arr = text.split(" ")
    new_arr = arr.map{ |word|
      if is_a_vowel?(word[0])
        word + "way"
      else
        consonants_arr = []
        word.split("").each_with_index{|letter, index|
          consonants_arr << word.slice(0..index-1) if is_a_vowel?(letter)
        }
        # ^ returns str and strawb when given strawberry
        # need to end once it finds the first vowel
        # gonna be hacky and take the first element from the consonants array, slice that from the beginning of the string, and add it to the end

        if (consonants_arr.length > 0)
          str_to_add = word.slice!(consonants_arr[0])
          word + str_to_add + "ay"
        else
          word + "way" #or just word i forget whats right
        end
      end
    }
    new_arr.join(" ")
  end

end