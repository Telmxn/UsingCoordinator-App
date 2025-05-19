//
//  LanguageTableViewCell.swift
//  AlowCoordinator
//
//  Created by Telman Yusifov on 19.05.25.
//

import UIKit

class LanguageTableViewCell: UITableViewCell {
    
    private var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 16
        view.alignment = .center
        return view
    }()
    
    private var leftStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 12
        view.alignment = .center
        view.distribution = .fillProportionally
        return view
    }()
    
    private var flagImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Fonts.interMedium.rawValue, size: 16)
        return label
    }()
    
    private var rightArrowImageView: UIImageView = {
        let view = UIImageView()
        view.image = .arrowRight
        view.tintColor = .onsurfaceQuaternary
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        
        contentView.addSubview(stackView)
        [leftStackView, rightArrowImageView].forEach(stackView.addArrangedSubview)
        [flagImageView, nameLabel].forEach(leftStackView.addArrangedSubview)
        
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(8)
        }
        
        flagImageView.snp.makeConstraints { make in
            make.size.equalTo(40)
        }
        
        rightArrowImageView.snp.makeConstraints { make in
            make.size.equalTo(20)
        }
    }
}

extension LanguageTableViewCell {
    func configure(language: Language) {
        flagImageView.image = language.getImage()
        nameLabel.text = language.getFullName()
    }
}
