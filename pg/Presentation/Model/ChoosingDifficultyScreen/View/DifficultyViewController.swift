//
//  DifficultyViewController.swift
//  pg
//
//  Created by Кирилл Полосов on 26.03.2022.
//

import UIKit
import SnapKit

class DifficultyViewController: UIViewController {
    
    private let resourceBegginer = "TrainingDataBeginner"
    private let resourceExpert = "TrainingDataExpert"
    private let resourceMaster = "TrainingDataMaster"
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private let difficultyBegginerButton = DifficultyButton()
    private let difficultyBegginerLabel: UILabel = {
        let label = UILabel()
        label.text = "Начинающий"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let difficultyExpertButton = DifficultyButton()
    private let difficultyExpertLabel: UILabel = {
        let label = UILabel()
        label.text = "Эксперт"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let difficultyMasterButton = DifficultyButton()
    private let difficultyMasterLabel: UILabel = {
        let label = UILabel()
        label.text = "Мастер"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Выберите сложность"
        view.backgroundColor = .white
        setConstraint()
        setState()
    }
    
    @objc func selectBeginnerDifficulty(_ sender: UIButton) {
        let viewDay = DayViewController()
        DataMethods.shared.fetchDataTrain(forResource: resourceBegginer) { data in
            viewDay.presenter.appendDataArrayTrain(data: data)
            print("Отправил dataBegginer в DayViewController \(data)")
        }
        navigationController?.pushViewController(viewDay, animated: true)
    }
    
    @objc func selectExpertDifficulty(_ sender: UIButton) {
        let viewDay = DayViewController()
        DataMethods.shared.fetchDataTrain(forResource: resourceExpert) { data in
            viewDay.presenter.appendDataArrayTrain(data: data)
            print("Отправил dataExpert в DayViewController \(data)")
        }
        navigationController?.pushViewController(viewDay, animated: true)
    }
    
    @objc func selectMasterDifficulty(_ sender: UIButton) {
        let viewDay = DayViewController()
        DataMethods.shared.fetchDataTrain(forResource: resourceMaster) { data in
            viewDay.presenter.appendDataArrayTrain(data: data)
            print("Отправил dataMaster в DayViewController \(data)")
        }
        navigationController?.pushViewController(viewDay, animated: true)
    }

}

extension DifficultyViewController {
    
    private func setState() {
        difficultyBegginerButton.setState(for: .beginner)
        difficultyBegginerButton.addTarget(self, action: #selector(selectBeginnerDifficulty(_:)), for: .touchUpInside)
        difficultyExpertButton.setState(for: .expert)
        difficultyExpertButton.addTarget(self, action: #selector(selectExpertDifficulty(_:)), for: .touchUpInside)
        difficultyMasterButton.setState(for: .master)
        difficultyMasterButton.addTarget(self, action: #selector(selectMasterDifficulty(_:)), for: .touchUpInside)
    }
    
    private func setConstraint() {
        
        buttonStackView.addArrangedSubview(difficultyBegginerButton)
        buttonStackView.addArrangedSubview(difficultyExpertButton)
        buttonStackView.addArrangedSubview(difficultyMasterButton)
        view.addSubview(buttonStackView)
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
        }
        difficultyBegginerButton.addSubview(difficultyBegginerLabel)
        difficultyBegginerLabel.snp.makeConstraints { make in
            make.top.equalTo(difficultyBegginerButton.snp.top).offset(20)
            make.leading.equalTo(difficultyBegginerButton.snp.leading).offset(20)
            make.trailing.equalTo(difficultyBegginerButton.snp.trailing).offset(-20)
        }
        
        difficultyExpertButton.addSubview(difficultyExpertLabel)
        difficultyExpertLabel.snp.makeConstraints { make in
            make.top.equalTo(difficultyExpertButton.snp.top).offset(20)
            make.leading.equalTo(difficultyExpertButton.snp.leading).offset(20)
            make.trailing.equalTo(difficultyExpertButton.snp.trailing).offset(-20)
        }
        
        difficultyMasterButton.addSubview(difficultyMasterLabel)
        difficultyMasterLabel.snp.makeConstraints { make in
            make.top.equalTo(difficultyMasterButton.snp.top).offset(20)
            make.leading.equalTo(difficultyMasterButton.snp.leading).offset(20)
            make.trailing.equalTo(difficultyMasterButton.snp.trailing).offset(-20)
        }
    }
    
}
