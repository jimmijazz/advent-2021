#!/usr/bin/env ruby

# https://adventofcode.com/2021/day/1
# Count the number of times a number increases from the previous number

# 1st approach - opening the file
# file = File.open("data.txt") # Open the text file
# file_data = file.readlines.map(&:chomp) # Split to new lines and remove new line char
# file.close # free up memory (can also just use File.read instead)

# Better approach - reading line

$deeperCount = 0
$previousValue
$currentValue

def updateAndCheckValues(value) 
    $currentValue = value.to_i # Convert string to number

    # First instance check
    if $previousValue.nil? 
        # Skip because no previous value
        puts "#{value} (n/a) - no previous measurement"
    elsif $currentValue > $previousValue
        # Not first instance
        $deeperCount += 1
        puts " #{value} (increased)"
    else 
        puts " #{value} (decreased)"
    end
    
    $previousValue = value.to_i  # Update previous value

end

File.foreach("data.txt") { | line | updateAndCheckValues(line)}
puts "Final Count: #{$deeperCount}"