//
//  DayViewController.swift
//  pg
//
//  Created by Кирилл Полосов on 16.03.2022.
//

import UIKit
import SnapKit

class DayViewController: UIViewController {
    
    var timer = Timer()
    
    var presenter: DayPresenterType = DayPresenter()
    
    private let itemsPerRow: CGFloat = 4
    private let sectionInserts = UIEdgeInsets(top: 15, left: 15, bottom: 5, right: 15)
    
    private let buttonPlay: UIButton = {
        let button = UIButton()
        button.setTitle("Начать 1 день", for: .normal)
        button.backgroundColor = .blue
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.register(DayCollectionViewCell.self, forCellWithReuseIdentifier: DayCollectionViewCell.identifier)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Plank Chalenge"
        
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        buttonPlay.addTarget(self, action: #selector(tappedPlay(_:)), for: .touchUpInside)
        collectionView.delegate = self
        collectionView.dataSource = self
        setConstraint()
    }
 
    @objc func tappedPlay(_ sender: UIButton) {
        
    }

}

//MARK: CollectionViewDelegate, DataSource
extension DayViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Кол-во в DayViewController \(presenter.numbersOfRows())")
        return presenter.numbersOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayCollectionViewCell.identifier, for: indexPath) as! DayCollectionViewCell
        let cellPresenter = presenter.dayArrayTrain(indexPath: indexPath)
        cell.presenter = cellPresenter
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.removeCurrentTrain()
        presenter.appendCurrentArray(indexPath: indexPath)
    }
    
}

//MARK: SetConstraint
extension DayViewController {
    
    private func setConstraint() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
        }
        
        view.addSubview(buttonPlay)
        buttonPlay.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(30)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-30)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
        }
    }
    
}

//MARK: FlowLayout
extension DayViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingWidth = sectionInserts.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
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



