//
//  ServicesTableViewCell.swift
//  AlowCoordinator
//
//  Created by Telman Yusifov on 18.05.25.
//

import UIKit

protocol ServicesTableViewCellDelegate {
    func didChooseService(service: ServiceModel)
}

class ServicesTableViewCell: UITableViewCell {
    
    private var delegate: ServicesTableViewCellDelegate?
    
    private var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.spacing = 8
        return view
    }()
    
    private var topStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .equalSpacing
        return view
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font  = UIFont(name: Fonts.interBold.rawValue, size: 22 )
        label.text = "Xidmətlər"
        label.textColor = .black
        return label
    }()
    
    private var showAllLabel: UILabel = {
        let label = UILabel()
        label.text = "Hamsına bax"
        label.font = UIFont(name: Fonts.interMedium.rawValue, size: 16)
        label.textColor = .brandBase
        return label
    }()
    
    private var servicesStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 4
        view.distribution = .fillEqually
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func subscribe(_ delegate: ServicesTableViewCellDelegate) {
        self.delegate = delegate
    }
    
    private func setupUI() {
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 24
        backgroundColor = .clear
        
        contentView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(4)
            make.horizontalEdges.equalToSuperview()
        }
        
        contentView.addSubview(stackView)
        [titleLabel, showAllLabel].forEach(topStackView.addArrangedSubview)
        [topStackView, servicesStackView].forEach(stackView.addArrangedSubview)
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
    }
    
    struct Item {
        let services: [ServiceModel]
    }
    
    func configure(item: Item) {
        item.services.forEach { service in
            let serviceView = ServiceView(name: service.name, minPrice: service.minPrice, maxPrice: service.maxPrice)
            serviceView.onTap = { [weak self] name, minPrice, maxPrice in
                self?.delegate?.didChooseService(service: .init(logo: .plane, name: name, minPrice: minPrice, maxPrice: maxPrice))
            }
            servicesStackView.addArrangedSubview(serviceView)
        }
    }

    
}
