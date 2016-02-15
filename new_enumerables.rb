#CODE SECTION

module Enumerable
    
    def my_each(array, &block)
        i = 0
        while i < array.length do
            yield(array[i])
            i += 1
        end
    end
end

#TEST SECTION


def my_each_test
    test_array = ["Dino", "Mega", "Giga"]
    puts "Test array: #{test_array}"
    test_array.my_each do |el|
        puts el + "zor!"
    end
end

puts my_each_test