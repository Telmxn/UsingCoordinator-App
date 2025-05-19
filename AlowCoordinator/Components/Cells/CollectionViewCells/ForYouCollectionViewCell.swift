//
//  ForYouCollectionViewCell.swift
//  AlowCoordinator
//
//  Created by Telman Yusifov on 18.05.25.
//

import UIKit

class ForYouCollectionViewCell: UICollectionViewCell {
    
    private var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        view.distribution = .fillProportionally
        view.alignment = .leading
        return view
    }()
    
    private var languagesStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 8
        view.alignment = .center
        view.distribution = .fillProportionally
        return view
    }()
    
    private var fromLanguageImageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private var arrowLanguageImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "arrow.right")
        view.tintColor = .onsurfaceQuaternary
        return view
    }()
    
    private var toLanguageImageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Fonts.interMedium.rawValue, size: 16)
        label.numberOfLines = 0
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
        [languagesStackView, nameLabel].forEach(stackView.addArrangedSubview)
        [fromLanguageImageView, arrowLanguageImageView, toLanguageImageView].forEach(languagesStackView.addArrangedSubview)
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
        
        fromLanguageImageView.snp.makeConstraints { make in
            make.size.equalTo(32)
        }
        
        arrowLanguageImageView.snp.makeConstraints { make in
            make.size.equalTo(16)
        }
        
        toLanguageImageView.snp.makeConstraints { make in
            make.size.equalTo(32)
        }
    }
    
    
}

extension ForYouCollectionViewCell {
    struct Item {
        let name: String?
        let fromLanguage: Language?
        let toLanguage: Language?
    }
    func configure(item: Item) {
        nameLabel.text = item.name
        fromLanguageImageView.image = item.fromLanguage?.getImage()
        toLanguageImageView.image = item.toLanguage?.getImage()
    }
}
