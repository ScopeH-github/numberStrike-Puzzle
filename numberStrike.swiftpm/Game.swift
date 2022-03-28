import SwiftUI
import Foundation

public struct Game {
    var ining = 1
    var strike = 0
    var ball = 0
    var isWin = false
    var thinkNumber: String = ""
}

public var currentGame = Game()

public func newGame() {
    var threeNumber: String = ""
    while threeNumber.count < 3 {
        let number = Int.random(in: 0...9)
        if !threeNumber.contains("\(number)") {
            threeNumber += "\(number)"
        }
    }
    currentGame.thinkNumber = threeNumber
    currentGame.ining = 1
    currentGame.strike = 0
    currentGame.ball = 0
    currentGame.isWin = false
}

public func checkNumber(_ text: String) {
    currentGame.strike = 0
    currentGame.ball = 0
    
    let num = currentGame.thinkNumber
    
    for i in 0..<3 {
        let textIndex = text.index(text.startIndex, offsetBy: i)
        let numIndex = num.index(num.startIndex, offsetBy: i)
        if num.contains(text[textIndex]) {
            currentGame.ball += 1
            if num[numIndex] == text[textIndex] {
                currentGame.ball -= 1
                currentGame.strike += 1
            }
        }
    }
    
    if currentGame.strike == 3 {
        currentGame.isWin = true
    } else {
        currentGame.ining += 1
    }
}

public func buttonDisabled(_ item: String, _ text: String) -> Bool {
    if currentGame.isWin {
        return true
    }
    if currentGame.ining > 9 {
        return true
    }
    if text.contains(item) {
        return true
    }
    return false
}

public func displayNumber(_ text: String) -> String {
    if currentGame.ining > 9 || currentGame.isWin {
        return currentGame.thinkNumber
    }
    if text.isEmpty {
        return "---"
    }
    return text
}

public func displayScore() -> String {
    if currentGame.isWin {
        return "You Won!"
    }
    if currentGame.ining == 1 {
        return "Game Start"
    }
    if currentGame.ining > 9 {
        return "You Lose"
    }
    if currentGame.strike == 0 && currentGame.ball == 0 {
        return "Out!"
    }
    return "\(currentGame.strike) strike(s), \(currentGame.ball) ball(s)"
}
