//
//  DayCellPresenter.swift
//  pg
//
//  Created by Кирилл Полосов on 18.03.2022.
//

import Foundation

protocol DayCellPresenterType: AnyObject {
    var day: Int { get }
}

final class DayCellPresenter: DayCellPresenterType {
   
    private var model: TrainingData
    
    var day: Int {
        return model.day
    }
    
    init(model: TrainingData) {
        self.model = model
    }
}
