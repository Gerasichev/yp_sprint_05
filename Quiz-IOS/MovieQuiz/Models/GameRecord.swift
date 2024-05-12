//
//  GameRecord.swift
//  MovieQuiz
//
//  Created by Герасичев Сергей on 12.05.2024.
//

import Foundation
import UIKit

struct GameRecord: Codable {
    let correct: Int
    let total: Int
    let date: Date
    
    func isBetterThan(_ another: GameRecord) -> Bool {
            correct > another.correct
    }
}
