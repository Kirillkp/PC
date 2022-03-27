//
//  TrainingPresenter.swift
//  pg
//
//  Created by Кирилл Полосов on 27.03.2022.
//

import Foundation
import UIKit

protocol TrainingPresenterType {
    func appendCurrentTrain(train: [TrainingData])
    func iterationTrainingFunc(timeLabel: UILabel, nameTrain: UILabel, imageTrain: UIImageView, circleTimerView: CircleTimerView)
    func pauseTimer()
    func continueTimer()
    var pause: Bool { get }
    func skipTrain()
}

final class TrainingPresenter: TrainingPresenterType {
    
    var timer = Timer()
    var currentTrain: [TrainingData] = []
    var pause: Bool = false
    var current: Int = 0 {
        didSet {
            if current < currentTrain[0].training.count {
                timme = Int(currentTrain[0].training[current].time)
            } else {
                timer.invalidate()
            }
        }
    }
    var timme: Int = 5
    func appendCurrentTrain(train: [TrainingData]) {
        currentTrain = train
        print("Выбранная тренировка в TrainingView \(currentTrain)")
    }
    
    func iterationTrainingFunc(timeLabel: UILabel, nameTrain: UILabel, imageTrain: UIImageView, circleTimerView: CircleTimerView) {
        if !currentTrain.isEmpty && current < currentTrain[0].training.count {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [self]_ in
                timeLabel.text = String(timme)
                nameTrain.text = currentTrain[0].training[current].name
                imageTrain.image = UIImage(named: currentTrain[0].training[current].image)
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
    
    func pauseTimer() {
        timer.invalidate()
        pause = true
        print("-----STOP------")
    }
    
    func continueTimer() {
        pause = false
        print("-----START------")
    }
    
    func skipTrain() {
        print("Условие пропуска \(current < currentTrain[0].training.count)")
        if current < currentTrain[0].training.count {
            current += 1
            print(current)
        }
    }
    
}
