#!/usr/bin/env ruby

# https://adventofcode.com/2021/day/2
# Moving the submarine
# What do you get if you multiply your final horizontal position by your final depth
# Up - decreses depth
# Down - increases depth
# Forward - increases horizontal position 

# Positions just start at 0
$horizontalPos = 0
$depthPos = 0

def moveSub(instruction)
    arr = instruction.split
    direction = arr[0]
    value = arr[1].to_i

    case direction
    when "forward"
        $horizontalPos += value
    when "down"
        $depthPos += value
    when "up"
        $depthPos -= value
    end
end

File.foreach("data.txt") { | line | moveSub(line)}

puts "Final Horizontal Position = #{$horizontalPos}"
puts "Final depth Position = #{$depthPos}"
puts "Answer: #{$depthPos * $horizontalPos}"