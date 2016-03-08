#CODE SECTION

module Enumerable
    
    def my_each
        i = 0
        while i < self.length do
            yield(self[i])
            i += 1
        end
    end
    
    def my_each_with_index
        i = 0
        while i < self.length do
            yield(self[i], i)
            i += 1
        end
    end
    
    def my_select
        result = []
        self.my_each do |el|
            selected = yield(el)
            if selected == true
                result << el
            end
        end
        return result
    end
    
    def my_all?
        result = true
        self.my_each do |el|
            truth_test = yield(el)
            if truth_test == false
                result = false
            end
        end
        return result
    end
    
    def my_any?
        result = false
        self.my_each do |el|
            truth_test = yield(el)
            if truth_test == true
                result = true
            end
        end
        return result
    end
    
    def my_none?
        result = true
        self.my_each do |el|
            truth_test = yield(el)
            if truth_test == true
                result = false
            end
        end
        return result
    end
    
    def my_count
        result = 0
        if block_given?
            self.my_each do |el|
                truth_test = yield(el)
                if truth_test == true
                    result += 1
                end
            end
            return result
        else
            return self.length
        end
    end
    
    def my_map
        result = []
        self.my_each_with_index do |el, index|
            result[index] = yield(el)
        end
        return result
    end
    
    def my_inject(memo = nil)
        result = (memo == nil ? self[0] : memo)
        self.each do |el|
            result = yield(result, el)
        end
        return result
    end
end

#----------------------------------------------------------------------
#TEST SECTION
#----------------------------------------------------------------------

def my_each_test
    test_array = ["Dino", "Mega", "Giga"]
    puts "MY EACH TEST:"
    puts "Test array: #{test_array}"
    test_array.my_each do |el|
        puts el + "zor!"
    end
end

puts my_each_test

def my_each_with_index_test
    test_array = ["Zero", "One", "Two"]
    puts "MY EACH WITH INDEX TEST"
    puts "Test array: #{test_array}"
    test_array.my_each_with_index do |el, index|
        puts "#{el} is #{index}"
    end
end

puts my_each_with_index_test

def my_select_test
    test_array = [1, 2, 3, 4, 5, 6]
    puts "MY SELECT TEST"
    puts "Test array: #{test_array}"
    result = test_array.my_select {|el| el > 4}
    puts "Should output all numbers greater than 4"
    p result
end

my_select_test

def my_all_test
    test_array_1 = ["foobar", "foobaz"]
    test_array_2 = ["foobar", "baz"]
    puts "MY ALL TEST"
    puts "Test array 1: #{test_array_1}"
    puts "Test array 2: #{test_array_2}"
    puts "Should output true:"
    p test_array_1.my_all? {|el| el.length > 4}
    puts "Should output false:"
    p test_array_2.my_all? {|el| el.length > 4}
end

my_all_test

def my_any_test
    test_array_1 = ["foobar", "baz"]
    test_array_2 = ["foo", "baz"]
    puts "MY ANY TEST"
    puts "Test array 1: #{test_array_1}"
    puts "Test array 2: #{test_array_2}"
    puts "Should output true:"
    p test_array_1.my_any? {|el| el.length > 4}
    puts "Should output false:"
    p test_array_2.my_all? {|el| el.length > 4}
end

my_any_test

def my_none_test
    test_array_1 = ["foobar", "foobaz"]
    test_array_2 = ["foo", "baz"]
    puts "MY NONE TEST"
    puts "Test array 1: #{test_array_1}"
    puts "Test array 2: #{test_array_2}"
    puts "Should output true:"
    p test_array_1.my_none? {|el| el.length < 4}
    puts "Should output false:"
    p test_array_2.my_none? {|el| el.length < 4}
end

my_none_test

def my_count_test
    test_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    puts "MY COUNT TEST"
    puts "Test array: #{test_array}"
    puts "Should equal 9:"
    p test_array.my_count
    puts "Should equal 5:"
    p test_array.my_count {|el| el < 6}
end

my_count_test

def my_map_test
    test_array = [1, 2, 3, 4, 5]
    puts "MY MAP TEST"
    puts "Test array: #{test_array}"
    puts "Should multiply all values by 2:"
    answer = test_array.my_map {|el| el * 2}
    p answer
end

my_map_test

def multiply_els
    puts "MY INJECT TEST"
    puts "This test multiplies all the elements in an array together."
    test_array = [1, 2, 3, 4, 5, 6, 7]
    puts "Should equal 5040:"
    answer = test_array.my_inject {|prod, el| prod * el}
    p answer
end

multiply_els