//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Герасичев Сергей on 08.05.2024.
//

import Foundation
import UIKit

struct AlertModel {
    let title: String
    let message: String
    let buttonText: String
    let completion: () -> Void
}
