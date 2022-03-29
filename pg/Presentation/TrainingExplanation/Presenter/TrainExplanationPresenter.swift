//
//  TrainExplanationPresenter.swift
//  pg
//
//  Created by Кирилл Полосов on 28.03.2022.
//

import Foundation

protocol TrainExplanationPresenterType {
    func appendExplanationTrain(train: Training)
    func fetchExplanationTrain() -> (train: Training?, description: String?)
}

final class TrainExplanationPresenter: TrainExplanationPresenterType {
    var explanationTrain: Training?
    var descriptionTrain: [TrainExplanation] = []
    
    func appendExplanationTrain(train: Training) {
        explanationTrain = train
    }
    
    func fetchExplanationTrain() -> (train: Training?, description: String?) {
        DataMethods.shared.fetchExplanationTrain(forResource: "TrainExplanation") { [weak self] data in
            self?.descriptionTrain.append(contentsOf: data)
        }
        let description = descriptionTrain.filter { description in
            return description.name == explanationTrain?.name
        }
        if !description.isEmpty {
            return (explanationTrain, description[0].description)
        }
        return (nil, nil)
    }
}
