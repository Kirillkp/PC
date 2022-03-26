//
//  DifficultyButton.swift
//  pg
//
//  Created by Кирилл Полосов on 26.03.2022.
//

import UIKit

class DifficultyButton: UIButton {

    enum DifficultyButton {
        case beginner
        case expert
        case master
    }
    
    func setState(for state: DifficultyButton) {
        switch state {
        case .beginner:
            beginnerButtonState()
        case .expert:
            expertButtonState()
        case .master:
            masterButtonState()
        }
    }
    
    private func beginnerButtonState() {
        setImage(UIImage(named: "difficultyBeginner"), for: .normal)
        imageView?.contentMode = .scaleAspectFill
        imageView?.clipsToBounds = true
        imageView?.layer.cornerRadius = 20
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func expertButtonState() {
        setImage(UIImage(named: "difficultyExpert"), for: .normal)
        imageView?.contentMode = .scaleAspectFill
        imageView?.clipsToBounds = true
        imageView?.layer.cornerRadius = 20
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func masterButtonState() {
        setImage(UIImage(named: "difficultyMaster"), for: .normal)
        imageView?.contentMode = .scaleAspectFill
        imageView?.clipsToBounds = true
        imageView?.layer.cornerRadius = 20
        translatesAutoresizingMaskIntoConstraints = false
    }

}
