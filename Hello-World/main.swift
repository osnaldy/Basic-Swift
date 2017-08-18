////
////  main.swift
////  Hello-World
////
////  Created by Osnaldy Vasquez on 8/14/17.
////  Copyright © 2017 Osnaldy Vasquez. All rights reserved.
////
import Foundation

class nameShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
    
}
class Square: nameShape
{
    var sideLength: Double
    
    init(sideLength: Double, name: String)
    {
        self.sideLength = sideLength
        super.init(name: name)
        
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with side of length \(sideLength)"
    }
}

class Circle: nameShape {
    
    var radius: Double
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
        
    }
    
    func area() -> Double {
        return Double.pi * pow(radius, 2.0)
    }
    
    override func simpleDescription() -> String {
        return "A circle with the radius of \(radius)"
    }
}

let test = Square(sideLength: 5.2, name: "My test Square")
print(test.area())
print(test.simpleDescription())

let test1 = Circle(radius: 7.3, name: "My Test Circle")
print(test1.area())


var name = nameShape(name: "Osnaldy")
name.numberOfSides = 10
print(name.simpleDescription())

class Shape
{
    var numberOfSides = 0
    let numberOfObjects = 2
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    func simpleObjects(number: Int) -> String {
        return "There are \(numberOfObjects) objects"
    }
}

var shape = Shape()

shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
print(shapeDescription)

var shapeObjects = shape.simpleObjects(number: 2)
print(shapeObjects)
//---------------------------------------------------------------

func returnFifteen() -> Int
{
    var y = 10
    
    func add()
    {
        y += 5
    }
    add()
    
    return y
}
print(returnFifteen())

//---------------------------------------------------------------
func makeIncrement() -> ((Int) -> Int)
{
    func addOne(number: Int) -> Int
    {
        return 1 + number
    }
    return addOne
}

var increment = makeIncrement()
print(increment(7))

//---------------------------------------------------------------

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool
{
    for item in list
    {
        if condition(item)
        {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool
{
    return number < 10
}

var numbers = [20, 19, 7, 12]

print(hasAnyMatches(list: numbers, condition: lessThanTen))

//---------------------------------------------------------------

var new_result = numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})
print(new_result)

var otherNumbers = [1, 4, 3, 5, 8, 9, 6]

var newStuff = otherNumbers.map({ (number: Int) -> Int in
    var results = 0
    
    if number % 2 == 0
    {
        results = 3 * number
    }
    return results
})

print(newStuff)
//---------------------------------------------------------------
func greet(_ person: String, on day: Int) -> String {
    return "Hello \(person) today is \(day)"
}
print(greet("Osnaldy", on: 13))
//-------------------------------------------------------------
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
