#!/usr/bin/env ruby

# https://adventofcode.com/2021/day/2
# Moving the submarine
# What do you get if you multiply your final horizontal position by your final depth
# down X increases your aim by X units.
# up X decreases your aim by X units.
# forward X does two things:
# It increases your horizontal position by X units.
# It increases your depth by your aim multiplied by X.


# Now, the above example does something different:

# forward 5 adds 5 to your horizontal position, a total of 5. Because your aim is 0, your depth does not change.
# down 5 adds 5 to your aim, resulting in a value of 5.
# forward 8 adds 8 to your horizontal position, a total of 13. Because your aim is 5, your depth increases by 8*5=40.
# up 3 decreases your aim by 3, resulting in a value of 2.
# down 8 adds 8 to your aim, resulting in a value of 10.
# forward 2 adds 2 to your horizontal position, a total of 15. Because your aim is 10, your depth increases by 2*10=20 to a total of 60.

# Positions just start at 0
$horizontalPos = 0
$depthPos = 0
$aim = 0


def moveSub(instruction)
    arr = instruction.split
    direction = arr[0]
    value = arr[1].to_i

    case direction
    when "forward"
        $depthPos += $aim * value
        $horizontalPos += value
    when "down"
        $aim += value
    when "up"
        $aim -= value
    end
end

File.foreach("data.txt") { | line | moveSub(line)}

puts "Final Horizontal Position = #{$horizontalPos}"
puts "Final depth Position = #{$depthPos}"
puts "Answer: #{$depthPos * $horizontalPos}"