#!/usr/bin/env ruby
#https://adventofcode.com/2021/day/3



$gammaRate # Most common integer in each position
$epsilonRate # Leaast common integer in each position

$columnCount = Array.new(12,0)

def gammaRate(array) 
    gammaString = ""
    array.each do |a|
        if a > 500
            gammaString += "1"
        else
            gammaString += "0"
        end
    end
    return gammaString
end

def epsilonRate(array) 
    epsilonString = ""
    array.each do |a|
        if a > 500
            epsilonString += "0"
        else
            epsilonString += "1"
        end
    end
    return epsilonString
end

def returnPowerConsumption(gamma,epsilon)
    return gamma.to_i * epsilon.to_i
end

def convertBaseStringToInt(baseString)
    return baseString.to_s(2)
end

def addLineToTotal(line)
    values = line.split("") #split line into values
    # values.compact # remove nil
    values.reject!{|n| n == "\n"} # remove empty
   
    # Loop over each column
    column = 0
    values.each do |v|
        v.to_i
         $columnCount[column] += v.to_i
        column += 1
    end
end

# Get total lines and just check if > 500 to know if the sum is greater
File.foreach("data.txt") { | line | addLineToTotal(line)}

# puts $columnCount
puts gammaRate($columnCount).to_i(2)
puts epsilonRate($columnCount).to_i(2)
puts gammaRate($columnCount).to_i(2) *  epsilonRate($columnCount).to_i(2)
puts returnPowerConsumption(gammaRate($columnCount), epsilonRate($columnCount))
# puts convertBaseStringToInt(returnPowerConsumption(gammaRate($columnCount), epsilonRate($columnCount)))
