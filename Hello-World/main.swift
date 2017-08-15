//
//  main.swift
//  Hello-World
//
//  Created by Osnaldy Vasquez on 8/14/17.
//  Copyright © 2017 Osnaldy Vasquez. All rights reserved.
//

import Foundation

//---------------------------------------------------------------
func greet(_ person: String, on day: Int) -> String {
    return "Hello \(person) today is \(day)"
}
print(greet("Osnaldy", on: 13))

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int)
{
    var min = scores[0]
    
    var max = scores[0]
    
    var sum = 0
    
    for score in scores
    {
        if score > max
        {
            max = score
        }
        else if score < min{
            
            min = score
        }
        
        sum += score
    }
    
    return (min, max, sum)
}

let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics)
print(statistics.sum)
print(statistics.2)

//---------------------------------------------------------------
var total: Int = 0

for i in 0..<4
{
    total += i
}
print(total)

//---------------------------------------------------------------
let interestingNumbers = [

    "Prime": [2, 3, 5, 7, 11, 13],
    
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    
    "Square": [1, 4, 9, 16, 25],
]

var largest = 0
var numberType = ""

for (kind, numbers) in interestingNumbers
{
    print(kind, numbers)
    for number in numbers
    {
        if number > largest
        {
            numberType = kind
            largest = number
        }
    }
}
print(numberType, largest)
//---------------------------------------------------------------

let vegetable = "red pepper"

switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log")
case "cucumber", "watercress":
    print("That would make a good tea sandwich")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)")
default:
    print("Everything taste good on a soup")
    
}
//---------------------------------------------------------------
let label = "The width is "
let width: Int = 94
let widthLabel = label + String(width)
print(widthLabel)

//---------------------------------------------------------------

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples"
print(appleSummary)

var individualScores = [75, 43, 103, 87, 12]

var teamScore = 0

for score in individualScores
{
    if score > 50
    {
        teamScore += 3
    }
    else
    {
        teamScore += 1
    }
}
print(teamScore)

//---------------------------------------------------------------
var optionalStuff: String? = "HelloWorld"
print(optionalStuff == nil)

var optionalName: String? = nil

var greetings = "hello!"

if let name = optionalName
{
    greetings = "Hello, \(name)"
}
else{
    greetings = "Hello, Osnaldy"
}
print(greetings)
//---------------------------------------------------------------
