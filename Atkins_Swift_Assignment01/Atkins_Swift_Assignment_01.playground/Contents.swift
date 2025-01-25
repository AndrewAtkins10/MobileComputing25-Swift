import UIKit

//*******Questions******//
// 1. In which year was the first version of the Swift programming language introduced?
// Explain why Swift is considered a modern and user-friendly programming language.
// Also, describe type safety and type inference in Swift with examples.
print("Swift was first indrocued in 2014 at the WWDC. Swift is modern and consumer friendly due to it's empahasis on simplicty and performance, along with it's saefty features. It is designed to be one of the fastest C-based languages in the world. In fact, it even integrates into Objective-C so that porting existing projects between C and Swift is very easy. Swift is also very visual, especially when developing apps and games as we have seen through the first couple weeks of class. Type Safety is when a language enforces type 'correctness at compile time to prevent type-related errors'. An exaple of this would be   var name: String='John' , this would be caught early and not later. Type inference allows Swift itself to determine the type of varaible or constant wihtout the user explicitly saying it. For example, let num = 10 . This would automatically make num an int even though I did not state that it was an int. ")
print("-----------------------")
// End of question 1


// 2. Declare a constant 'pi' of type Double with the value 3.14. Write code to calculate
// the area of a circle with a radius of 10.0 units using the formula: Area = pi * radius * radius.
// Print the calculated area as shown in the sample output below:
// "The area of the circle with radius 10.0 is **** square units."
let pi: Double = 3.14
let radius: Double = 10.0
let area = pi * radius * radius
print("The area of the circle with radius 10.0 is \(area) square units")
print("----------------------")
// End of question 2


// 3. Declare a variable with a value of 212°F (boiling point of water) in Fahrenheit, convert it to Celsius,
// and round it to one decimal place. Print the result in this format:
// "Temperature: 212°F is equivalent to ****°C."
var far: Double = 212.0
let cel = (far - 32) * 5 / 9
let roundCel = round(cel * 10) / 10
print("Temperature: 212°F is equivalent to \(roundCel)°C.")
print("----------------------")
// End of question 3


// 4. Write three statements about why Swift is a great language for beginners and developers.
// Display the first two statements on one line and the third statement on the next line using print statements.
print("Swift i so beginner friendly because of how visual it is, everything is essentially drag and drop where you want it on the phone. With integrations of C, it allows for people that have never coded in the language to adapt easily")
print("It offers things like Swift playgrounds so that you can experiment and give students homework assignments in the code itself")
print("----------------------")
// End of question 4


// 5. Display the following using a single print statement:
// "Swift is an intuitive, powerful, and safe programming language designed for iOS and other Apple platforms.
// It offers modern features, concise syntax, and exceptional performance that developers love."
print("Swift is an intuitive, powerful, and safe programming language designed for iOS and other Apple platforms. \nIt offers modern features, concise syntax, and exceptional performance that developers love.")

print("----------------------")
// End of question 5


// 6. Declare two variables, num1 and num2, and assign them any two 3-digit numbers.
// Write code to calculate their product and determine how many digits the product contains.
// Print the result in this format:
// "The product of <num1> and <num2> is ****, and it has **** digits."
let num1 = 213
let num2 = 811
let multi = num1 * num2
let count = String(multi).count
print("The product of \(num1) and \(num2) is \(multi), and it has \(count) digits.")
print("----------------------")
// End of question 6


// 7. Create a variable with the value "Swift programming is fun!".
// Count the total number of characters excluding spaces and print them as individual characters separated by "+".
// For example: "S+w+i+f+t+p+r+o+g+r+a+m+m+i+n+g+i+s+f+u+n"
var val:String = "Swift programming is fun"
let filter = val.replacingOccurrences(of: " ", with: "")
let final = filter.map { String($0) }.joined(separator: "+")
print("The modified text is: \n\(final)")
print("----------------------")
// End of question 7


// 8. A car is traveling at a constant velocity of 20 m/s for 12 seconds.
//Calculate the total distance traveled during this time period using the formula:
//Distance = velocity × time
//Print the result in this format:
//"The car traveled a distance of **** meters."
let velo: Double = 20.0
let time: Double = 12.0
let distanceTrav = velo * time
print("The car traveled a distance of \(distanceTrav) meters.")
print("----------------------")
// End of question 8





