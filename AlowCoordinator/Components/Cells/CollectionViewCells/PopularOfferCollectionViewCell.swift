//
//  PopularOfferCollectionViewCell.swift
//  AlowCoordinator
//
//  Created by Telman Yusifov on 18.05.25.
//

import UIKit

class PopularOfferCollectionViewCell: UICollectionViewCell {
    
    private var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        view.distribution = .fillProportionally
        view.alignment = .leading
        return view
    }()
    
    private var logoView: UIView = {
        let view = UIView()
        view.backgroundColor = .brandBase
        view.layer.cornerRadius = 24
        return view
    }()
    
    private var logoImageView: UIImageView = {
        let view = UIImageView()
        view.tintColor = .black
        return view
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Fonts.interMedium.rawValue, size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private var languageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.interMedium.rawValue, size: 16)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        layer.cornerRadius = 24
        backgroundColor = .surfaceTeritary
        
        addSubviews(stackView)
        [logoView, nameLabel, languageLabel].forEach(stackView.addArrangedSubview)
        logoView.addSubview(logoImageView)
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
        
        logoView.snp.makeConstraints { make in
            make.size.equalTo(48)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.size.equalTo(24)
            make.center.equalToSuperview()
        }
    }
    
    
}

extension PopularOfferCollectionViewCell {
    struct Item {
        let logo: UIImage?
        let name: String?
        let fromLanguage: Language?
        let toLanguage: Language?
    }
    func configure(item: Item) {
        logoImageView.image = item.logo
        nameLabel.text = item.name
        languageLabel.text = "\(item.fromLanguage?.rawValue ?? "") → \(item.toLanguage?.rawValue ?? "")"
    }
}
