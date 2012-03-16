# metaprogramming to the rescue!

class Numeric
  @@currencies = {'dollar' => 1, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}

  def __common_stuff (curr)
    singular_currency = curr.to_s.sub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      yield @@currencies[singular_currency]
    else
      yield
    end
  end

  def method_missing(method_id)
    __common_stuff(method_id) do |q| q ? self * q : super; end
  end

  def in (dest)
    __common_stuff(dest) do |q| q ? self / q : self; end
  end
end

class String
  def palindrome?
    ch = self.gsub(/[^\w]+/, '').downcase;
    ch == ch.reverse
  end
end

module Enumerable
  def palindrome?
    self.entries == self.entries.reverse
  end
end

%Q{
def test
  yield 1
end

test { |x| yield x+1 }
}

puts (10 + 1).euros.in :yen

puts [3,4,3].palindrome?
puts "Rac~~~Ec:A!r".palindrome?






