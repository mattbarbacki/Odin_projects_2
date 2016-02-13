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
	array.each_index do |index|
		yield(array[index], array[index + 1]) if array[index + 1] != nil
	end
end