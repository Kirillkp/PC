//
//  DayPresenter.swift
//  pg
//
//  Created by Кирилл Полосов on 18.03.2022.
//

import Foundation

protocol DayPresenterType {
    func numbersOfRows() -> Int
    func dayArrayTrain(indexPath: IndexPath) -> DayCellPresenterType?
    func appendDataArrayTrain(data: [TrainingData])
    func fetchArrayTrainIndexPath(indexPath: IndexPath) -> TrainingData
}

final class DayPresenter: DayPresenterType {
    
    var arrayTrain: [TrainingData] = []
    
    func appendDataArrayTrain(data: [TrainingData]) {
        arrayTrain.append(contentsOf: data)
    }
    
    func numbersOfRows() -> Int {
        return arrayTrain.count
    }
    
    func fetchArrayTrainIndexPath(indexPath: IndexPath) -> TrainingData {
        return arrayTrain[indexPath.row]
    }
    
    func dayArrayTrain(indexPath: IndexPath) -> DayCellPresenterType? {
        let arrayTrain = arrayTrain[indexPath.row]
        print("Тренировка в ячейку DayPresenter \(arrayTrain)")
        return DayCellPresenter(model: arrayTrain)
    }

}
