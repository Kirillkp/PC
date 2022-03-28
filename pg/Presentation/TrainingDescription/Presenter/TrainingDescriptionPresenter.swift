//
//  TrainingDescriptionPresenter.swift
//  pg
//
//  Created by Кирилл Полосов on 27.03.2022.
//

import Foundation

protocol TrainingDescriptionPresenterType {
    func appendDataCurrentTrain(data: TrainingData)
    func fetchCurrentTrain() -> [TrainingData]
    func numbersOfRows() -> Int
}

class TrainingDescriptionPresenter: TrainingDescriptionPresenterType {
    
    var currentTrain: [TrainingData] = []
    
    func numbersOfRows() -> Int {
        return currentTrain[0].training.count
    }
    
    func appendDataCurrentTrain(data: TrainingData) {
        currentTrain.append(data)
//        print("Выбранная тренировка \(currentTrain)")
    }
    
    func fetchCurrentTrain() -> [TrainingData] {
//        print("Полученна в ячейку \(currentTrain)")
        return currentTrain
    }

}
