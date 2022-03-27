//
//  TrainingViewController.swift
//  pg
//
//  Created by Кирилл Полосов on 27.03.2022.
//

import UIKit
import SnapKit

final class TrainingViewController: UIViewController {
    
    var presenter: TrainingPresenterType = TrainingPresenter()
    
    private let circleTimerView = CircleTimerView()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 80)
        label.text = "5"
        label.tintColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageTrainView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let nameTrainLabel: UILabel = {
        let label = UILabel()
        label.text = "Название упражнения"
        label.font = UIFont.boldSystemFont(ofSize: 21)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private let pauseButton = TrainButton()
    private let skipButton = TrainButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setConstraint()
        setState()
        presenter.iterationTrainingFunc(timeLabel: timeLabel, nameTrain: nameTrainLabel, imageTrain: imageTrainView, circleTimerView: circleTimerView)
    }

    @objc func pauseTimer(_ sender: UIButton) {
        if presenter.pause == false {
            pauseButton.setState(for: .continuee)
            presenter.pauseTimer()
        } else if presenter.pause == true {
            pauseButton.setState(for: .pause)
            presenter.continueTimer()
            presenter.iterationTrainingFunc(timeLabel: timeLabel, nameTrain: nameTrainLabel, imageTrain: imageTrainView, circleTimerView: circleTimerView)
        }
    }
    
    @objc func skipTrain(_ sender: UIButton) {
        presenter.skipTrain()
        pauseButton.setState(for: .continuee)
        presenter.pauseTimer()
    }
    
}

extension TrainingViewController {
    
    private func setState() {
        circleTimerView.translatesAutoresizingMaskIntoConstraints = false
        circleTimerView.backgroundColor = .white
        circleTimerView.trackFillColor = .green
        circleTimerView.trackBackgroundColor = .gray
        circleTimerView.progress = 1
        circleTimerView.trackWidth = 14
        
        pauseButton.setState(for: .pause)
        pauseButton.addTarget(self, action: #selector(pauseTimer(_:)), for: .touchUpInside)
        skipButton.setState(for: .skip)
        skipButton.addTarget(self, action: #selector(skipTrain(_:)), for: .touchUpInside)
        
    }
    
    private func setConstraint() {
        view.addSubview(imageTrainView)
        imageTrainView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.height.equalTo(220)
        }
        
        imageTrainView.addSubview(nameTrainLabel)
        nameTrainLabel.snp.makeConstraints { make in
            make.top.equalTo(imageTrainView.snp.top).offset(20)
            make.leading.equalTo(imageTrainView.snp.leading).offset(20)
            make.trailing.equalTo(imageTrainView.snp.trailing).offset(-20)
        }
        
        view.addSubview(circleTimerView)
        circleTimerView.snp.makeConstraints { make in
            make.top.equalTo(imageTrainView.snp.bottom).offset(50)
            make.leading.equalTo(view.snp.leading).offset(50)
            make.trailing.equalTo(view.snp.trailing).offset(-50)
            make.height.equalTo(circleTimerView.snp.width)
        }
        
        circleTimerView.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { make in
            make.centerXWithinMargins.equalTo(circleTimerView.snp.centerXWithinMargins)
            make.centerYWithinMargins.equalTo(circleTimerView.snp.centerYWithinMargins)
        }
        
        buttonStackView.addArrangedSubview(pauseButton)
        buttonStackView.addArrangedSubview(skipButton)
        
        view.addSubview(buttonStackView)
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(circleTimerView.snp.bottom).offset(30)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-30)
            make.leading.equalTo(view.snp.leading).offset(30)
            make.trailing.equalTo(view.snp.trailing).offset(-30)
        }
        
    }
    
}
