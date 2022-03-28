//
//  TrainingDescriptionCollectionViewCell.swift
//  pg
//
//  Created by Кирилл Полосов on 27.03.2022.
//

import UIKit

final class TrainingDescriptionCollectionViewCell: UICollectionViewCell {
   
    static let identifier = "Cell"
    
    let nameTrainLabel: UILabel = {
        let label = UILabel()
        label.text = "Прямая с вытянутыми руками"
        label.textColor = .gray
        label.backgroundColor = .green
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timeTrainLabel: UILabel = {
        let label = UILabel()
        label.text = "20"
        label.textColor = .gray
        label.backgroundColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageTrainView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .magenta
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .lightGray
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.borderWidth = 2
        contentView.layer.cornerRadius = 20
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension TrainingDescriptionCollectionViewCell {
    private func setConstraint() {
        
        contentView.addSubview(imageTrainView)
        imageTrainView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.trailing.equalTo(contentView.snp.trailing).offset(-20)
            make.bottom.equalTo(contentView.snp.bottom).offset(-20)
            make.width.equalTo(100)
        }
        
        contentView.addSubview(nameTrainLabel)
        nameTrainLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.leading.equalTo(contentView.snp.leading).offset(20)
            make.trailing.equalTo(imageTrainView.snp.leading).offset(-20)
        }
        
        contentView.addSubview(timeTrainLabel)
        timeTrainLabel.snp.makeConstraints { make in
            make.top.equalTo(nameTrainLabel.snp.bottom).offset(20)
            make.leading.equalTo(contentView.snp.leading).offset(20)
            make.trailing.equalTo(imageTrainView.snp.leading).offset(-20)
            make.bottom.equalTo(contentView.snp.bottom).offset(-20)
        }
    }
}
