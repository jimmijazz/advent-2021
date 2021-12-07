#!/usr/bin/env ruby

# https://adventofcode.com/2021/day/1#part2
# Three sliding window


def sumArray(array)
    # Returns the sum of all array elements
    sumVal = 0;
    array.each do |a|
        sumVal += a
    end
    return sumVal
end

# Move our file into an array
$rawArray = []
File.foreach("data.txt") { | line | $rawArray << line.to_i}

# Convert array into Hash
$index = 0 # index we're at for looping initial array
$windowHash = Hash.new # Our 3-window {0=>[171, 173, 174], 1=>{}...

$rawArray.each do |d|
    val1 = $rawArray[$index]
    val2 = $rawArray[$index + 1]
    val3 = $rawArray[$index + 2] 
    $windowHash[$index] = [val1, val2, val3]
    $index += 1
end

$deeperCount = 0 # How many instances we've found of current > prev
$previousValue = 0

# Loop over hash
$windowHash.each do |key, value|
    # Check it has 3 values
    if value.length() != 3 || value.any?{ |e| e.nil? } 
        puts "Not enough elements - #{value}"
    else 
        currentValue = sumArray(value) # Get the sum of elements
        if key == 0 # Check if it's the first element 
            puts "${sumArray(value) (N/A - no previous sum)"
        elsif currentValue > $previousValue 
            $deeperCount += 1
            puts " #{value} | #{currentValue} | #{$previousValue} | (increased)"
        elsif currentValue == $previousValue
            puts " #{value} (no change)"
         else
            puts " #{value} | #{currentValue} | #{$previousValue} | (decresed)"
        end
        $previousValue = currentValue
    end
end

puts $deeperCount