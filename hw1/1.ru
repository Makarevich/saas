def palindrome? s
    s = s.downcase.gsub(/\W*/, '')
    s == s.reverse
end

print palindrome? "aBr.arba"
print palindrome? "Abracadabra"

def meta tt
    print(tt(3))
end

meta ({ |a| a+3 })
meta { |a| a-3 }

