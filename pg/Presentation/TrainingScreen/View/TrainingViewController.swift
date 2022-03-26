//
//  DifficultyViewController.swift
//  pg
//
//  Created by Кирилл Полосов on 26.03.2022.
//

import UIKit

class TrainingViewController: UIViewController {

    private let circleTimerView = CircleTimerView()
    
    private let timeLabelTimer: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 80)
        label.text = "0"
        label.tintColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .purple
        image.layer.cornerRadius = 10
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circleTimerView.translatesAutoresizingMaskIntoConstraints = false
        circleTimerView.backgroundColor = .white
        circleTimerView.trackFillColor = .green
        circleTimerView.trackBackgroundColor = .gray
        circleTimerView.progress = 1
        circleTimerView.trackWidth = 14
    }

}
