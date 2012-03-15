class CartesianProduct
  include Enumerable
  # your code here

  def initialize (*stuff)
      @stuff = stuff.reverse
  end

  def each
    l = lambda do |v|
      yield v
    end

    @stuff.each do |x|
      prev = l
      l = lambda do |pr|
        #puts "> #{pr.inspect} #{x.inspect}"
        x.each do |y|
          prev.call(pr + [y])
        end
      end
    end
    l.call []
  end
end

c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]

c = CartesianProduct.new([:a,:b], [1, 2], [:q, :w, :e])
c.each { |elt| puts elt.inspect }
# (nothing printed since Cartesian product
# of anything with an empty collection is empty)

