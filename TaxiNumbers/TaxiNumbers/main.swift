//
//  main.swift
//  TaxiNumbers
//
//  Created by Dzmitry on 12/28/19.
//  Copyright © 2019 Dzmitry Krukov. All rights reserved.
//

import Foundation

// MARK: - Task 2
func taxiNumbers(arrayOfTaxiNumberPlates: [String]) -> Int {

    // MARK: Make array
    var arrayOfChar = [String]()
    var arrayOfNumbers = [[String]]()

    for value in arrayOfTaxiNumberPlates {
        for char in value {
            arrayOfChar.append(String(char))
        }
        arrayOfNumbers.append(arrayOfChar)
        arrayOfChar.removeAll()
    }

    var countOfBadNumbers = 0
    var countOfTaxi = 0

    for item in arrayOfNumbers {
        var str = ""
        var markerForRegion = false
        var zeroNumber = ""

        // MARK: Length check
        if item.count <= 9 {
            for (index, value) in item.enumerated() {
                if index == 0 && (value == "1" || value == "2" || value == "3" || value == "4" || value == "5" || value == "6") {
                    str += "1"
                    markerForRegion = true
                }
                if index == 0 && value == "7" {
                    str += "1"
                }
                if index == 1 && value == "T" {
                    str += "1"
                }
                if index == 2 && (value == "A" || value == "B" || value == "E") && !markerForRegion {
                    str += "1"
                }
                if index == 2 && (value == "A" || value == "B") && markerForRegion {
                    str += "1"
                }
                if index == 3 && value == "X" {
                    str += "1"
                }
                if index == 4 && value == " " {
                    str += "1"
                }
                if index == 5 && (value == "0" || value == "1"  || value == "2" || value == "3" || value == "4" || value == "5" || value == "6" || value == "7" || value == "8" || value == "9") {
                    str += "1"
                    if value == "0" {
                        zeroNumber += "1"
                    }
                }
                if index == 6 && (value == "0" || value == "1"  || value == "2" || value == "3" || value == "4" || value == "5" || value == "6" || value == "7" || value == "8" || value == "9") {
                    str += "1"
                    if value == "0" {
                        zeroNumber += "1"
                    }
                }
                if index == 7 && (value == "0" || value == "1"  || value == "2" || value == "3" || value == "4" || value == "5" || value == "6" || value == "7" || value == "8" || value == "9") {
                    str += "1"
                    if value == "0" {
                        zeroNumber += "1"
                    }
                }
                if index == 8 && (value == "0" || value == "1"  || value == "2" || value == "3" || value == "4" || value == "5" || value == "6" || value == "7" || value == "8" || value == "9") {
                    str += "1"
                    if value == "0" {
                        zeroNumber += "1"
                    }
                }
            }
        } else { countOfBadNumbers += 1 }

        // MARK: Four zero in number
        if zeroNumber == "1111" {
            str += "1"
        }

        // MARK: Check
        if str == "111111111" {
            countOfTaxi += 1
        }
    }

    return countOfTaxi
}

guard let countOfCarNumbers = readLine() else { fatalError("Bad input") }
var array = [String]()

if let count = Int(countOfCarNumbers) {
    for _ in 1...count {
        guard let number = readLine() else { fatalError("Bad input") }
        array.append(number)
    }
} else { fatalError("Entered input 'countOfCarNumbers' is \(countOfCarNumbers) of the type: \(type(of: countOfCarNumbers)). Enter Int value!") }

print(taxiNumbers(arrayOfTaxiNumberPlates: array))

// Test data
//Test 1 - 2
//9
//7TAX 9215
//6TEX 9125
//a236ye 73
//21-14 BOT
//3412 0321 GR
//1TBX 0021-7
//2-TBX 0001
//1TBX 0000
//1TBX 0020

//Test 2 - 1
//7
// 7TAX 7777
//1TAX  1111
//1TAX 1111 
//1TAX-1111
//1TAX 0000
//7TEX 1234
//3TAX
