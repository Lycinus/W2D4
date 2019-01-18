require 'byebug'
def my_min(arr)
    arr.each do |num1|
        return num1 if arr.all? {|num2| num2 >= num1}
    end
    nil
end

def my_min_2(arr)
    return nil if arr.nil? || arr.empty?
    lowest = arr.first
    arr.each do |num|
        lowest = num if lowest > num
    end
    lowest 
end

def lcs(arr)
    return nil if arr.nil? || arr.empty?
    sub_set = []
    arr.length.times do |i|
        (i...arr.length).each do |j|
            sub_set << arr[i..j]
        end
    end
    sub_set.map {|sub|sub.reduce(:+)}.max
end

def lcs_2(arr)
    return nil if arr.nil? || arr.empty?
    return arr.first if arr.length == 1
    global_largest = arr.first
    current_largest = arr.first
    arr[1..-1].each do |el|
        if current_largest <= 0
            current_largest = el
        else
            current_largest += el
        end

        if current_largest > global_largest
            global_largest = current_largest
        end
    end

    global_largest
end

def first_anagram(str1, str2)
    anagrams = str1.chars.permutation.map(&:join)
    anagrams.each do |anagram|
        return true if anagram == str2
    end
    false
end

def second_anagram(str1, str2)
   # debugger
    str2_chars = str2.chars

    str1.each_char do |ch|
        str2_index = str2_chars.index(ch)
        return false if str2_index.nil?
        str2_chars.delete_at(str2_index)
    end
    return false if !str2_chars.empty?
    true
end

def third_anagram(str1, str2)
    str1.chars.sort == str2.char.sort
end

def fourth_anagram(str1, str2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)
    
    str1.chars.each do |char|
        hash1[char] += 1
    end

    str2.chars.each do |char|
        hash2[char] += 1
    end

    hash1 == hash2
end



