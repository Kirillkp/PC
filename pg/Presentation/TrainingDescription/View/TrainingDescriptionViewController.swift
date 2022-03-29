//
//  TrainingDescriptionViewController.swift
//  pg
//
//  Created by Кирилл Полосов on 27.03.2022.
//

import UIKit

final class TrainingDescriptionViewController: UIViewController {
    
    let presenter: TrainingDescriptionPresenterType = TrainingDescriptionPresenter()
    
    private let itemsPerRow: CGFloat = 1
    private let sectionInserts = UIEdgeInsets(top: 15, left: 15, bottom: 5, right: 15)

    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.register(TrainingDescriptionCollectionViewCell.self, forCellWithReuseIdentifier: TrainingDescriptionCollectionViewCell.identifier)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let buttonPlay: UIButton = {
        let button = UIButton()
        button.setTitle("Начать тренировку", for: .normal)
        button.backgroundColor = .blue
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        setConstraint()
        buttonPlay.addTarget(self, action: #selector(tappedPlay(_:)), for: .touchUpInside)
    }

    @objc func tappedPlay(_ sender: UIButton) {
        let viewTraining = TrainingViewController()
        viewTraining.presenter.appendCurrentTrain(train: presenter.fetchCurrentTrain())
        navigationController?.pushViewController(viewTraining, animated: true)
    }
    
}

//MARK: CollectionViewDelegate, DataSource
extension TrainingDescriptionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numbersOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrainingDescriptionCollectionViewCell.identifier, for: indexPath) as! TrainingDescriptionCollectionViewCell
        let currentTrain = presenter.fetchCurrentTrain()[0].training[indexPath.row]
        cell.imageTrainView.image = UIImage(named: currentTrain.image)
        cell.nameTrainLabel.text = currentTrain.name
        cell.timeTrainLabel.text = String(currentTrain.time)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewTrainExplanation = TrainExplanationViewController()
        viewTrainExplanation.presenter.appendExplanationTrain(train: self.presenter.fetchCurrentTrain()[0].training[indexPath.row])
        navigationController?.present(viewTrainExplanation, animated: true, completion: nil)
    }
    
}

//MARK: SetConstraint
extension TrainingDescriptionViewController {
    
    private func setConstraint() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(0)
            make.leading.equalTo(view.snp.leading).offset(0)
            make.trailing.equalTo(view.snp.trailing).offset(0)
        }
        
        view.addSubview(buttonPlay)
        buttonPlay.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(30)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-30)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.height.equalTo(50)
        }
    }
    
}

//MARK: FlowLayout
extension TrainingDescriptionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingWidth = sectionInserts.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
}
