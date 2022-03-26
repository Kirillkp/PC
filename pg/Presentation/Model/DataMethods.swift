//
//  IterationTrain.swift
//  pg
//
//  Created by Кирилл Полосов on 26.03.2022.
//

import Foundation
import UIKit

class DataMethods {
    
    static let shared = DataMethods()
    
    func iterationFunc(currentTrain: [TrainingData], timer: Timer, timerLabel: UILabel, circleTimerView: CircleTimerView, closure: @escaping () -> Void) {
        if !currentTrain.isEmpty {
        var timer = timer
        var current: Int = 0 {
            didSet {
                if current < currentTrain[0].training.count {
                    timme = Int(currentTrain[0].training[current].time)
                } else {
                    timer.invalidate()
                }
            }
        }
        var timme: Int = 2
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
                timerLabel.text = String(timme)
                circleTimerView.setProgress( Double(timme) / Double(currentTrain[0].training[current].time), animated: true)
                timme -= 1
                if timme == -1 {
                    current += 1
                }
            })
        } else {
            print("Выберите тренировку")
        }
    }
    
    func fetchDataTrain(forResource: String, completion: @escaping ([TrainingData]) -> Void) {
        if let url = Bundle.main.url(forResource: forResource, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let arrayTrain = try JSONDecoder().decode([TrainingData].self, from: data)
                completion(arrayTrain)
            } catch {
                print("Error!! Unable to parse .json")
            }
        }
    }
}
