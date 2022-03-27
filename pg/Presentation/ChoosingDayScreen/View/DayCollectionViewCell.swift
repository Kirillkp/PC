//
//  DayCollectionViewCell.swift
//  pg
//
//  Created by Кирилл Полосов on 16.03.2022.
//

import UIKit

final class DayCollectionViewCell: UICollectionViewCell {
    
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
        contentView.backgroundColor = .white
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.borderWidth = 2
        contentView.layer.cornerRadius = contentView.bounds.height / 2
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    weak var presenter: DayCellPresenterType? {
        willSet(presenter) {
            guard let presenter = presenter else { return }
            dayLabel.text = String(presenter.day)
        }
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
