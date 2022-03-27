//
//  DayPresenter.swift
//  pg
//
//  Created by Кирилл Полосов on 18.03.2022.
//

import Foundation

protocol DayPresenterType {
    func numbersOfRows() -> Int
    func removeCurrentTrain()
    func appendCurrentArray(indexPath: IndexPath)
    func dayArrayTrain(indexPath: IndexPath) -> DayCellPresenterType?
    func appendDataArrayTrain(data: [TrainingData])
    func fetchCurrentTrain() -> [TrainingData]
}

class DayPresenter: DayPresenterType {
    
    var arrayTrain: [TrainingData] = []
    var currentTrain: [TrainingData] = []
    
    func appendDataArrayTrain(data: [TrainingData]) {
        arrayTrain.append(contentsOf: data)
    }
    
    func numbersOfRows() -> Int {
        return arrayTrain.count
    }
    
    func removeCurrentTrain() {
        return currentTrain.removeAll()
    }
    
    func appendCurrentArray(indexPath: IndexPath) {
        currentTrain.append(arrayTrain[indexPath.row])
        print("Выбрал тренировку в DayViewController \(currentTrain))")
    }
    
    func dayArrayTrain(indexPath: IndexPath) -> DayCellPresenterType? {
        let arrayTrain = arrayTrain[indexPath.row]
        return DayCellPresenter(model: arrayTrain)
    }
    
    func fetchCurrentTrain() -> [TrainingData] {
        return currentTrain
    }
}
