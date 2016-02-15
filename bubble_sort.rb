def bubble_sort(input_array)
	array = input_array
	array.length.times do	
		array.each_index do |index|
#			puts "Element is #{array[index]}, index is #{index}."
			if array[index + 1] != nil && array[index] > array[index + 1]
				temp = array[index + 1]
				array[index + 1] = array[index]
				array[index] = temp
			end
#			p array
		end
	end
	return array
end

def bubble_sort_by(input_array, &block)
	array = input_array
	array.length.times do
		array.each_index do |index|
			if array[index + 1] != nil
				block_result = yield(array[index], array[index + 1])
				if block_result > 0
					temp = array[index]
					array[index] = array[index + 1]
					array[index + 1] = temp
				end
			end
		end
	end
	return array
end

def test_bubble_sort_by
	bubble_sort_by(["hi","hello","hey", "hakuna matatta", "lol"]) do |left,right|
		left.length - right.length
    end
    
end

test_bubble_sort_by