//
//  main.swift
//  Hello-World
//
//  Created by Osnaldy Vasquez on 8/14/17.
//  Copyright © 2017 Osnaldy Vasquez. All rights reserved.
//
//
import Foundation

//---------------------------------------------------------------
enum Rank: Int {
    
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "Ace"
            
        case .jack:
            return "Jack"
        case .queen:
            return "Queen"
        case .king:
            return "King"
        case .ten:
            return "Ten"
        default:
            return String(self.rawValue)
        }
    }
}
//---------------------------------------------------------------

enum Suits {
    case spades, hearts, diamonds, clubs
    
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "Spades"
        case .hearts:
            return "Hearts"
        case .diamonds:
            return "Diamonds"
        case .clubs:
            return "Clubs"
        }
    }
    
    func color() -> String {
        switch self {
        case .spades:
            return "Black"
        case .hearts:
            return "Red"
        case .diamonds:
            return "Red"
        case .clubs:
            return "Black"
        }
    }
}

//---------------------------------------------------------------
struct Card {
    
    var rank: Rank
    var suit: Suits
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
}

func createDeck() -> [Card] {
    
    var deck = [Card]()
    
    let ranks = [Rank.ace, Rank.two, Rank.three, Rank.four, Rank.five, Rank.six, Rank.seven, Rank.eight, Rank.nine, Rank.ten, Rank.jack, Rank.queen, Rank.king]
    
    let suits = [Suits.spades, Suits.hearts, Suits.diamonds, Suits.clubs]
    
    
    for suit in suits {
        
        for rank in ranks {
            deck.append(Card(rank: rank, suit: suit))
        }
    }
    
    return deck
    
}

func printDeck(deck: [Card])
{
    for card in deck {
        print(card.simpleDescription())
    }
}

let threeOfSpades = Card(rank: .three, suit: .spades)
//print(threeOfSpades.simpleDescription())

var newVar = createDeck()

//printDeck(deck: newVar)

let convertedRank = Rank(rawValue: 1)

print(convertedRank?.simpleDescription())

//---------------------------------------------------------------

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A Very simple class"
    var anotherProperty: Int = 69105
    
    func adjust() {
        simpleDescription += "   Now 100% adjusted."
    }
}

var a = SimpleClass()

a.adjust()

let aDescription = a.simpleDescription

print(aDescription)

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A Simple structure"
    
    mutating func adjust() {
        simpleDescription += "  (adjusted)"
    }
}

var b = SimpleStructure()

b.adjust()

let bDescription = b.simpleDescription

print(bDescription)

enum SimpleEnum : ExampleProtocol {

    case Adjusted, Base
    
    var simpleDescription: String
    {
        switch self {
        case .Adjusted:
            return "This is the adjusted Size"
        case .Base:
            return "This is a Base case"
    }
        }
    
    mutating func adjust() {
        switch self {
        case .Adjusted:
            self = .Adjusted
            
        case .Base:
            
            self = .Base
        }
    }
}

extension Int: ExampleProtocol
{
    var simpleDescription: String {
        return "The number \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
    
}
var numvar = 7
print(numvar.adjust())


print(numvar.simpleDescription)


extension Double
{
    var absoluteValue: Double
    {
       return abs(self)
    }
}

let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)


let exampleAbsoluteValue: Double = -40
print(exampleAbsoluteValue.absoluteValue)

print()
var c = SimpleEnum.Adjusted
var cDescription = c.simpleDescription
print(cDescription)

c.adjust()
print(c.simpleDescription)

var d = SimpleEnum.Base
print(d.simpleDescription)



//---------------------------------------------------------------
enum ServerResponse {
    case result(String, String)
    case failure(String)
    case smtp(String)
    
}

let success = ServerResponse.result("6:00 am", "8:09 pm")

let failure = ServerResponse.failure("Out of Cheese")

let smtp = ServerResponse.smtp("Simple Message Transfer Protocol")

switch smtp {
    
case let .result(sunrise, sunset):
    
    print("Sunrise is at \(sunrise) and Sunset is at \(sunset).")
    
case let .failure(message):
    
    print("Failure.... \(message)")
    
case let .smtp(message):
    
    print("Something else went wrong..... \(message)")
}

//---------------------------------------------------------------
func compareRank(num1: Rank, num2: Rank) -> Bool
{
    return num1.rawValue == num2.rawValue
}

print(compareRank(num1: Rank.eight, num2: Rank.queen))

let ace = Rank.ace
let aceRawValue = ace.rawValue
print(aceRawValue)

//---------------------------------------------------------------

let hearts = Suits.hearts
let heartsDescription = hearts.simpleDescription()
let heartsColor = hearts.color()
print(heartsDescription, heartsColor)

//---------------------------------------------------------------
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

//---------------------------------------------------------------
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

//---------------------------------------------------------------
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
//---------------------------------------------------------------
class EquilateralTriangle: nameShape
{
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double
    {
        get {
            return 3.0 * sideLength
        }
        
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "A equilateral triangle with side of length \(sideLength)"
    }
}

//---------------------------------------------------------------
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle =  EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 20.0, name: "Another Shape")

print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)

triangleAndSquare.square = Square(sideLength: 50, name: "Larger Square")
print(triangleAndSquare.triangle.sideLength)

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

let test = Square(sideLength: 5.2, name: "My test Square")
print(test.area())
print(test.simpleDescription())

let test1 = Circle(radius: 7.3, name: "My Test Circle")
print(test1.area())


var name = nameShape(name: "Osnaldy")
name.numberOfSides = 10
print(name.simpleDescription())

//---------------------------------------------------------------
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
