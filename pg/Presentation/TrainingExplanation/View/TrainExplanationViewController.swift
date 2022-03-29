//
//  TrainExplanationViewController.swift
//  pg
//
//  Created by Кирилл Полосов on 28.03.2022.
//

import UIKit
import SnapKit

final class TrainExplanationViewController: UIViewController {
    
    let presenter: TrainExplanationPresenterType = TrainExplanationPresenter()

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
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionTrainLabel: UITextView = {
        let textView = UITextView()
        textView.text = "Объяснение упражнения"
        textView.font = UIFont.boldSystemFont(ofSize: 17)
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setConstraint()
        fetchTrain()
    }
    
    private func fetchTrain() {
        guard let modelTrain = presenter.fetchExplanationTrain().train else { return }
        guard let description = presenter.fetchExplanationTrain().description else { return }
        imageTrainView.image = UIImage(named: modelTrain.image)
        nameTrainLabel.text = modelTrain.name
        descriptionTrainLabel.text = description
    }

}

extension TrainExplanationViewController {
    
    private func setConstraint() {
        view.addSubview(imageTrainView)
        imageTrainView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(0)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.height.equalTo(220)
        }
        
        view.addSubview(nameTrainLabel)
        nameTrainLabel.snp.makeConstraints { make in
            make.top.equalTo(imageTrainView.snp.bottom).offset(20)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.height.equalTo(30)
        }
        
        view.addSubview(descriptionTrainLabel)
        descriptionTrainLabel.snp.makeConstraints { make in
            make.top.equalTo(nameTrainLabel.snp.bottom).offset(20)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
    }
    
}
