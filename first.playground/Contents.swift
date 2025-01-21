import UIKit

var greeting = "Hello, playground"
print(greeting)

var welcome = "Welcome to swift"
print(welcome);
var name: String = " John"
print("Hello, \(name)!");
print("Hi, + name")
print("Hi, "+name)
print("Hi" , 12, 12.99)
//print cannot be cancatinated with the +, instead you must use ,
print("Hello, " ,name);
var batteryLife=12
print("Your battery lasts \(batteryLife) hours in average, and withoptimization, it could last \(batteryLife) +=3 //b= b +3)")
print(batteryLife)
let age=23
print(age)
print(age*2)
//age=age + 2 CANNOT DUE THIS. "LET" Makes it to where the varaible cannot be changed after being assigned
print(age)
print(age * 2)
var appName = "Xcode"
print(appName)
appName="Swift Playgrounds"
print(appName)
let version=17.0
print(version)

var deviceCount: Int=5
deviceCount=deviceCount * 3
print(deviceCount)
var feature="Widgets are amazing!"
print(feature)
print("feature")

var platform1="IOS"
var platform2="macOS"
print(platform1, platform2)
print(platform1,"-",platform2)
print(2023, 2025, 2030)
print(1.1, 2.5, 3.9)


var networkError = (errorCode: 500, errorMessage: "Internal Service Error")
print(networkError)
print(networkError.errorCode, terminator: ":")
print(networkError.errorMessage)

var user=(firstName: "Alice", lastName: "Johnson")
var fName=user.firstName
var lName=user.lastName
print(fName, terminator: ", ")
print(lName)

var origin = (x: 0, y:0)
var point = origin
print(point)
print("(",origin.x,"-", origin.y,")")
print("(\(origin.x),\(origin.y))")
let city = (name: "Cupertino", population: 60_000)
let(cityName,cityPopulation)=city.name, city.Population)
print(cityName)
print(cityPopulation)

let appFeatures = ("Dark Mode", "Offline Access", 17.0)
print(appFeatures.0)
print(appFeatures.1)
print(type(of:appFeatures))
                   

