//
//  main.swift
//  Base64
//
//  Created by Dzmitry on 12/30/19.
//  Copyright © 2019 Dzmitry Krukov. All rights reserved.
//

import Foundation

// MARK: - Task 1
// Возможны проблемы при компиляции из-за "pow" - функция возведения в степень
func toBase64(lenthString: Int, inString: String) -> String {
    var resultString = ""

    // MARK: From 16 number system to 2 number system
    func from16to2(inStr: String) -> String {
        var finalString = ""
        var arrayOfChar = [String]()
        for item in inStr {
            arrayOfChar.append(String(item))
        }
        for item in arrayOfChar {
            var valueToString = ""
            switch item {
            case "0":
                valueToString = "0000"
            case "1":
                valueToString = "0001"
            case "2":
                valueToString = "0010"
            case "3":
                valueToString = "0011"
            case "4":
                valueToString = "0100"
            case "5":
                valueToString = "0101"
            case "6":
                valueToString = "0110"
            case "7":
                valueToString = "0111"
            case "8":
                valueToString = "1000"
            case "9":
                valueToString = "1001"
            case "A":
                valueToString = "1010"
            case "B":
                valueToString = "1011"
            case "C":
                valueToString = "1100"
            case "D":
                valueToString = "1101"
            case "E":
                valueToString = "1110"
            case "F":
                valueToString = "1111"
            default:
                break
            }
            finalString += valueToString
        }
        return finalString
    }

    // MARK: From String to array of Int
    var arrayOfBits = [Int]()
    for item in from16to2(inStr: inString) {
        let optItem = Int(String(item))
        if let item = optItem {
            arrayOfBits.append(item)
        }
    }
    
    // MARK: Length check
    var newArrayOfBits = [Int]()
    for (index, value) in arrayOfBits.enumerated() {
        if index < (lenthString * 8) {
            newArrayOfBits.append(value)
        }
    }

    // MARK: Array of bits array
    var arrayOne = [Int]()
    var arrayTwo = [Int]()
    var workArray = [[Int]]()
    for (index, value) in newArrayOfBits.enumerated() {
        let count = newArrayOfBits.count
        arrayOne.append(value)
        if (index + 1) % 6 == 0 {
            workArray.append(arrayOne)
            arrayOne.removeAll()
        } else if index >= (count - (count % 6)){
            arrayTwo.append(value)
        }
    }

    // MARK: Add zero bits
    var countTwo = arrayTwo.count
    if countTwo > 0 {
        for _ in 1...6 {
            countTwo += 1
            if countTwo <= 6 {
                arrayTwo.append(0)
            } else {
                break
            }
        }
    }

    if countTwo > 0 {
        workArray.append(arrayTwo)
    }

    // MARK: From 2 number system to 10 number system
    func from2To10(inArray: [Int]) -> Int {
        var resValue = 0
        var someValue = 0
        for (index, val) in inArray.enumerated() {
            someValue = Int(pow(Double(2), Double(5 - index))) * val
            resValue += someValue
        }
        return resValue
    }

    // MARK: Get array of numbers
    var arrayOfNumbers = [Int]()
    for item in workArray {
        arrayOfNumbers.append(from2To10(inArray: item))
    }

    let base64Keys = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    var arrayOfSumbols = [String]()

    for item in base64Keys {
        arrayOfSumbols.append(String(item))
    }

    for item in arrayOfNumbers {
        for (index, val) in arrayOfSumbols.enumerated() {
            if item == index {
                resultString += val
            }
        }
    }

    while resultString.count % 4 != 0 {
        resultString += "="
    }

    return resultString
}

guard let length = readLine() else { fatalError("Bad input") }
guard let hex = readLine() else { fatalError("Bad input") }

if let length = Int(length) {
    print(toBase64(lenthString: length, inString: hex))
} else { fatalError("Entered input 'length' is \(length) of the type: \(type(of: length)). Enter Int value!") }

// Test data
//Test 1 - Q2F0
//3
//43 61 74

//Test 2 - D92kEg==
//4
//0F DD A4 12

//Test 3 - D92kEu56Ubw=
//8
//0F DD A4 12 EE 7A 51 BC

//Test 4 - eFDrNwSLBXj+JXHpR8iu
//15
//78 50 EB 37 04 8B 05 78 FE 25 71 E9 47 C8 AE
