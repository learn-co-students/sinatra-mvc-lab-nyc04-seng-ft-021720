class PigLatinizer
	# attr_writer :input_string
	def initialize
		
	end
	# def output
	# 	pig_latinize(@input_string)
	# end

	def piglatinize(input_string)
		words = input_string.split(' ')
		pl_words = words.map do |word|
			piglatinize_word(word)
		end
		pl_words.join(' ')
	end

	def piglatinize_word(input_string)
		array_of_letters = input_string.split('')
		output = ''
		save_string = ''
		found_vowel = false
		first_letter = true
		output_end = 'ay'
		consonant_block_open = false
		array_of_letters.each do |letter|

			if found_vowel
				# already found the first vowel, so just add this to the output array
				output += letter
			elsif check_if_consonant(letter)
				# puts "#{letter}: consonant"
				if first_letter
					# start the consonant block
					consonant_block_open = true
					# append it to the "save string"
					save_string += letter
				elsif consonant_block_open
					# in the midst the block, continue saving it
					save_string += letter
				else
					# append it to the output
					output += letter
				end
			elsif check_if_vowel(letter)
				# puts "#{letter}: vowel"
				found_vowel = true
				if first_letter
					# a vowel was the first letter, add a "w"
					output_end = 'w'+output_end
					# save the vowel to the output string
					output += letter
				else
					if consonant_block_open
						consonant_block_open = false
					end
					# just a subsequent vowel
					output += letter
				end
			# else
			# 	#something other than a vowel or consonant, just pass it
			# 	output += letter
			end

			# no longer the first letter
			first_letter = false
		end

		output = output + save_string + output_end
		output
	end
	def check_if_consonant(letter)
		# binding.pry
		if letter.downcase.count('bcdfghjklmnpqrstvwxyz') > 0
			true
		else
			false
		end
	end
	def check_if_vowel(letter)
		if letter.downcase.count('aeiou') > 0
			true
		else
			false
		end
	end
end