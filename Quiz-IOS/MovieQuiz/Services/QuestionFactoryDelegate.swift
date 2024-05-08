//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Герасичев Сергей on 07.05.2024.
//

import Foundation
import UIKit

protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
}
