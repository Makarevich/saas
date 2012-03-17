def palindrome? s
    s = s.downcase.gsub(/\W*/, '')
    s == s.reverse
end

def count_words s
    words = {}
    words.default = 0

    s.gsub (/\b\w+\b/) do |match|
        kk = match.downcase
        words[kk] = words[kk] + 1
    end

    words
end

%Q{
puts palindrome?("A man, a plan, a canal -- Panama")  #=> true 
puts palindrome?("Madam, I'm Adam!")  # => true 
puts palindrome?("Abracadabra")  # => false (nil is also ok) 

puts count_words("A man, a plan, a canal -- Panama") 
# => {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1} 
puts count_words "Doo bee doo bee doo"  # => {'doo' => 3, 'bee' => 2} 
}

