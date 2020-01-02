//
//  main.swift
//  TestProblem
//
//  Created by Dzmitry on 12/28/19.
//  Copyright © 2019 Dzmitry Krukov. All rights reserved.
//

import Foundation

// MARK: - Task 3
func testingProblem(numberOfTasks: Int, numberOfDevices: Int, testTime: [Int]) -> Int {
    var totalTime = 0
    var time = 0
    var count = 0
    let sortedArray = testTime.sorted{ $0 > $1 }
    
    if numberOfTasks <= numberOfDevices {
        for value in sortedArray {
            time += value
        }
        totalTime += time
    } else {
        for (index, value) in sortedArray.enumerated() {
            if numberOfDevices >= (index + 1) {
                time += value
            }
            else if numberOfDevices < (index + 1) {
                if (index + numberOfDevices) % numberOfDevices == 0 {
                    count += 1
                }
                time = (2 * count + 1) * value
            }
            totalTime += time
            time = 0
        }
    }
    
    return totalTime
}

guard let numberOfTasks = readLine() else { fatalError("Bad input") }
guard let numberOfDevices = readLine() else { fatalError("Bad input") }

var array = [Int]()

if let count = Int(numberOfTasks) {
    if let numberOfDevices = Int(numberOfDevices) {
        for _ in 1...count {
            guard let testTime = readLine() else { fatalError("Bad input") }
            if let testTime = Int(testTime) {
                array.append(testTime)
            } else { fatalError("Entered input 'testTime' is \(testTime) of the type: \(type(of: testTime)). Enter Int value!") }
        }
        
        print(testingProblem(numberOfTasks: count, numberOfDevices: numberOfDevices, testTime: array))
    } else { fatalError("Entered input 'numberOfDevices' is \(numberOfDevices) of the type: \(type(of: numberOfDevices)). Enter Int value!") }
} else { fatalError("Entered input 'numberOfTasks' is \(numberOfTasks) of the type: \(type(of: numberOfTasks)). Enter Int value!") }

// Test data
// Test 1 - 13
//3
//3
//6
//2
//5

// Test 2 - 17
//3
//2
//6
//2
//5
