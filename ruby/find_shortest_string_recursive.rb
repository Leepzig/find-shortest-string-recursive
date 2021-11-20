require 'benchmark'

def find_shortest_string_recursive(arr)
  # type your code in here
  first = arr.first
  last = arr.last
  if arr.length == 1
    return arr[0]
  elsif first.length > last.length
    arr.shift
    find_shortest_string_recursive(arr)
  elsif first.length <= last.length
    arr.pop
    find_shortest_string_recursive(arr)
  end
end

def find_shortest_string(arr)
  # type your code in here
  return arr.min { |a, b| a.length <=> b.length}
end

if __FILE__ == $PROGRAM_NAME
  puts "Expecting: 'a'"
  puts "=>", find_shortest_string_recursive(['aaa', 'a', 'bb', 'ccc'])

  puts

  puts "Expecting: 'hi'"
  puts "=>", find_shortest_string_recursive(['cat', 'hi', 'dog', 'an'])

  puts

  puts "Expecting: 'f'"
  puts "=>", find_shortest_string_recursive(['flo', "fows", "fo", "Found", "f", "cheese", "hi"])
  puts

  puts "Expecting: 'lily'"
  puts "=>", find_shortest_string_recursive(['flower', 'juniper', 'lily', 'dandelion'])
  
  # puts "Expecting: 'To break'"
  # puts "=>", find_shortest_string_recursive([])
  # puts
  # Don't forget to add your own!

# BENCHMARK HERE

  # long_array = []
  # arr = (0...50).map { ('a'..'z').to_a[rand(26)] }

  # 100.times do 
  #   str = arr.slice(rand(0..30), rand(1..20)).join
  #   long_array.append(str)
  # end

  def benchmark
    long_array = []
    arr = (0...50).map { ('a'..'z').to_a[rand(26)] }
  
    100.times do 
      str = arr.slice(rand(0..30), rand(1..20)).join
      long_array.append(str)
    end
    total_time = 0
    1000.times do
    time = Benchmark.measure {
      yield(long_array)
    }
    total_time = total_time + time.real
    end
    puts "Average Recursive Time:"
    puts total_time/1000
    end

    benchmark { |arr| find_shortest_string_recursive(arr)}
    benchmark { |arr| find_shortest_string(arr)}
end

# Please add your pseudocode to this file
# And a written explanation of your solution
# if first > last
# remove first el
# repeat function with new arr
# if first < last
# remove last
# if first == last
# remove last