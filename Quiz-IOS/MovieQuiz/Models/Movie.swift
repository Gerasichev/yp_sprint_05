//
//  Movie.swift
//  MovieQuiz
//
//  Created by Герасичев Сергей on 10.05.2024.
//

import Foundation
import UIKit

struct Actor: Codable {
    let id: String
    let image: String
    let name: String
    let asCharacter: String
}

struct Movie: Codable {
    let id: String
    let title: String
    let year: Int
    let image: String
    let releaseDate: String
    let runtimeMins: Int
    let directors: String
    let actorList: [Actor]
}

struct Top: Decodable {
    let items: [Movie]
}

func getMovie(from jsonString: String) -> Movie? {
    guard let data = jsonString.data(using: .utf8) else {
        return nil
    }

    do {
        
        let result = try? JSONDecoder().decode(Top.self, from: data)
        return result?.items.first
    } catch {
        print("Failed to parse: \(error.localizedDescription)")
        return nil
    }
}
