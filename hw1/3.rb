# input: ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']  
#  => output:  [["cars", "racs", "scar"], ["four"], ["for"], ["potatoes"], ["creams", "scream"]] 
# HINT: you can quickly tell if two words are anagrams by sorting their 
#  letters, keeping in mind that upper vs lowercase doesn't matter 

def combine_anagrams(words) 
 #   <YOUR CODE HERE> 

 heaps = {}

 words.each do |word|
    s = []
    word.downcase.chars do |c|
        s.push c
    end
    s1 = ''
    s.sort.each { |c|
        s1 = s1 + c
    }
        



    puts s1

    if heaps[s1]
        heaps[s1] = heaps[s1].push word
    else
        heaps[s1] = [word]
    end
 end
 heaps.values
end 

#puts combine_anagrams ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']  


