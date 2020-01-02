//
//  main.swift
//  Hike_final
//
//  Created by Dzmitry on 12/29/19.
//  Copyright © 2019 Dzmitry Krukov. All rights reserved.
//

import Foundation

// MARK: - Task 4
func arrayMaker(numbers: String) -> [(weight: Int, distance: Int)] {
    var array = [(weight: Int, distance: Int)]()
    
    if let count = Int(numbers) {
        for _ in 1...count {
            let inputArray = readLine()?.split {$0 == " "}.map (String.init)

            var tempStr = 0
            for (index, value) in (inputArray?.enumerated())! {
                
                if let intValue = Int(value) {
                    if (index == 0) {
                        tempStr = intValue
                    }
                    if (index == 1) {
                        array.append((weight: tempStr, distance: intValue))
                    }
                } else { fatalError("Entered input is \(value) of the type: \(type(of: value)). Enter Int value!") }
            }
        }
    } else { fatalError("Entered input 'numbers' is \(numbers) of the type: \(type(of: numbers)). Enter Int value!") }
    
    return array
}

guard let weight = readLine() else { fatalError("Bad input") }

// MARK: Enter products
guard let numberOfProducts = readLine() else { fatalError("Bad input") }
var arrayOfProducts = arrayMaker(numbers: numberOfProducts)

// MARK: Enter drinks
guard let numberOfDrinks = readLine() else { fatalError("Bad input") }
var arrayOfDrinks = arrayMaker(numbers: numberOfDrinks)

func hike(weight: Int, arrayOfProducts: [(weight: Int, distance: Int)], arrayOfDrinks: [(weight: Int, distance: Int)]) -> Int {
    var subtotal = 0
    var total = 0

    for prod in arrayOfProducts {
        for drink in arrayOfDrinks {
            if weight >= (prod.weight + drink.weight)  {
                if prod.distance < drink.distance {
                    subtotal = prod.distance
                } else {
                    subtotal = drink.distance
                }
                if subtotal > total {
                    total = subtotal
                }
            }
        }
    }

    return total
}

if let weight = Int(weight) {
    print(hike(weight: weight, arrayOfProducts: arrayOfProducts, arrayOfDrinks: arrayOfDrinks))
} else { fatalError("Entered input 'weight' is \(weight) of the type: \(type(of: weight)). Enter Int value!") }

// Test data
// Test 1 - 41
//123
//2
//46 71
//37 41
//2
//79 65
//84 23
