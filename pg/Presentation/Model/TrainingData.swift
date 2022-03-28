//
//  TrainingData.swift
//  pg
//
//  Created by Кирилл Полосов on 26.03.2022.
//

import Foundation

struct TrainingData: Codable {
    let day: Int
    var training: [Training]
}

struct Training: Codable {
    let time: Int
    let name: String
    let image: String
}
