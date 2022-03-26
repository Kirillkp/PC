//
//  DayCollectionViewCell.swift
//  pg
//
//  Created by Кирилл Полосов on 16.03.2022.
//

import UIKit

class DayCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "Cell"
    
    let dayLabel: UILabel = {
        let label = UILabel()
        label.tintColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .green
        contentView.layer.cornerRadius = contentView.bounds.height / 2
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DayCollectionViewCell {
    private func setConstraint() {
        contentView.addSubview(dayLabel)
        dayLabel.snp.makeConstraints { make in
            make.centerXWithinMargins.equalTo(contentView.snp_centerXWithinMargins)
            make.centerYWithinMargins.equalTo(contentView.snp_centerYWithinMargins)
        }
    }
}
