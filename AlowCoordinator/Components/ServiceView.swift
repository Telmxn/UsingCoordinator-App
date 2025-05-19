//
//  ServiceView.swift
//  AlowCoordinator
//
//  Created by Telman Yusifov on 18.05.25.
//

import UIKit

class ServiceView: UIView {
    
    private var serviceName: String
    private var minPrice: Int
    private var maxPrice: Int
    
    private var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalSpacing
        return view
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.interMedium.rawValue, size: 16)
        label.textColor = .black
        return label
    }()
    
    private var priceView: UIView = {
        let view = UIView()
        view.backgroundColor = .surfaceSecondary
        view.layer.cornerRadius = 12
        return view
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.interRegular.rawValue, size: 14)
        label.textColor = .black
        return label
    }()
    
    var onTap: ((String, Int, Int) -> Void)?
    
    init(name: String, minPrice: Int, maxPrice: Int) {
        self.serviceName = name
        self.minPrice = minPrice
        self.maxPrice = maxPrice
        super.init(frame: .zero)
        configure(name: name, minPrice: minPrice, maxPrice: maxPrice)
        setupGesture()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupGesture() {
        isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleTap() {
        onTap?(serviceName, minPrice, maxPrice)
    }

    
    private func setupUI() {
        backgroundColor = .surfaceTeritary
        layer.cornerRadius = 24
        
        addSubview(stackView)
        [nameLabel, priceView].forEach(stackView.addArrangedSubview)
        priceView.addSubview(priceLabel)
        
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(16)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(4)
            make.horizontalEdges.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().inset(4)
        }
    }
    
    private func configure(name: String, minPrice: Int, maxPrice: Int) {
        nameLabel.text = name
        priceLabel.text = "\(minPrice)-\(maxPrice) AZN"
    }
}
