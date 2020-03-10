class PigLatinizer


def piglatinize(string)

if string.split.size == 1 
    pig_word(string)
else
    pig_sentence(string)
end 

end 



def pig_word(word)

    vowels = %w[a e i o u A E I O U]
    
  
    if vowels.include?(word[0])
      word + "way"
    elsif 
      !vowels.include?(word[0]) && !vowels.include?(word[1]) && !vowels.include?(word[2])
        new_word = word[3..-1]+word[0..2] + "ay"
    
    elsif                                                                                                                                                           
      !vowels.include?(word[0]) && !vowels.include?(word[1])
        new_word = word[2..-1]+word[0..1] + "ay"
    elsif
      !vowels.include?(word[0])
      new_word = word[1..-1] + word[0] + "ay"
    end 
  
end 

def pig_sentence(sentence)

    sentence = sentence.split(" ").map do |words|
      pig_word(words)
    end 
  
   return sentence.join(" ")
  
    
  
end 
  
  
  





end 