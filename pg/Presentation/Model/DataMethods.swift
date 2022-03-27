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
