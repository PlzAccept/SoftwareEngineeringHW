# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  arr_sum = 0
  arr.each { |x| arr_sum += x }
  arr_sum
end

def max_2_sum arr
  a, b = arr.sort.last(2)
  (a || 0) + (b || 0)
end

def sum_to_n? arr, n
  require 'set'
  vis = Set.new
  arr.each { |x|
    return true if vis.include?(n - x)
    vis.add(x)
  }
  return false
end

# Part 2

def hello(name)
  "Hello, " << name
end

def starts_with_consonant? s
  s =~ /^[b-df-hj-np-tv-z]/i
end

def binary_multiple_of_4? s
  s == '0' or s =~ /^[01]*1[01]*00$/
end

# Part 3

class BookInStock
  attr_accessor :isbn
  attr_accessor :price
  
  def initialize(isbn, price)
    raise ArgumentError if isbn.empty? or price <= 0
    @isbn = isbn
    @price = price
  end
  
  def price_as_string
    "$%.2f" % price
  end
end
