//
//  StatisticServiceImplementation.swift
//  MovieQuiz
//
//  Created by Герасичев Сергей on 12.05.2024.
//

import Foundation
import UIKit

final class StatisticServiceImplementation: StatisticService {
    
    private enum Keys: String {
        case correct, total, bestGame, gamesCount
    }
    
    private let userDefaults = UserDefaults.standard
    
    var totalAccuracy: Double {
        let correct = userDefaults.integer(forKey: Keys.correct.rawValue)
        let total = userDefaults.integer(forKey: Keys.total.rawValue)
        return total == 0 ? 0 : (Double(correct) / Double(total)) * 100
    }
    
    var gamesCount: Int {
        get {
            return userDefaults.integer(forKey: Keys.gamesCount.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: Keys.gamesCount.rawValue)
        }
    }
    
    var bestGame: GameRecord {
        get {
            guard let data = userDefaults.data(forKey: Keys.bestGame.rawValue),
                  let record = try? JSONDecoder().decode(GameRecord.self, from: data) else {
                return .init(correct: 0, total: 0, date: Date())
            }
            return record
        }
        set {
            guard let data = try? JSONEncoder().encode(newValue) else {
                print("Невозможно сохранить результат")
                return
            }
            userDefaults.set(data, forKey: Keys.bestGame.rawValue)
        }
    }
    
    func store(correct count: Int, total amount: Int) {
        let newGame = GameRecord(correct: count, total: amount, date: Date())
        
        // Обновление общего количества правильных ответов и вопросов
        let currentCorrect = userDefaults.integer(forKey: Keys.correct.rawValue)
        let currentTotal = userDefaults.integer(forKey: Keys.total.rawValue)
        
        userDefaults.set(currentCorrect + count, forKey: Keys.correct.rawValue)
        userDefaults.set(currentTotal + amount, forKey: Keys.total.rawValue)
        
        // Обновление счётчика игр
        gamesCount += 1
        
        // Обновление лучшей игры, если новый результат лучше
        if newGame.isBetterThan(bestGame) {
            bestGame = newGame
        }
    }
}
