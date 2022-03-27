//
//  TrainButton.swift
//  pg
//
//  Created by Кирилл Полосов on 27.03.2022.
//

import UIKit

class TrainButton: UIButton {

    enum TrainButton {
        case pause
        case skip
        case continuee
    }
    
    func setState(for state: TrainButton) {
        switch state {
        case .pause:
            pauseButtonState()
        case .skip:
            skipButtonState()
        case .continuee:
            continueeButtonState()
        }
    }
    
    private func pauseButtonState() {
        backgroundColor = .white
        layer.cornerRadius = 20
        layer.borderColor = UIColor.green.cgColor
        layer.borderWidth = 2
        setTitle("Пауза", for: .normal)
        setTitleColor(UIColor.green, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func skipButtonState() {
        backgroundColor = .white
        layer.cornerRadius = 20
        layer.borderColor = UIColor.green.cgColor
        layer.borderWidth = 2
        setTitle("Пропустить", for: .normal)
        setTitleColor(UIColor.green, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func continueeButtonState() {
        backgroundColor = .green
        layer.cornerRadius = 20
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2
        setTitle("Продолжить", for: .normal)
        setTitleColor(UIColor.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }

}
