//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Герасичев Сергей on 12.05.2024.
//

import Foundation
import UIKit

protocol StatisticService {
    var totalAccuracy: Double { get }
    var gamesCount: Int { get }
    var bestGame: GameRecord { get }
    
    func store(correct count: Int, total amount: Int)
}
