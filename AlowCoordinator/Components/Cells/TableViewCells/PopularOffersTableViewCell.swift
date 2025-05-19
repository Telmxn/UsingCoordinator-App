//
//  PopularOffersTableViewCell.swift
//  AlowCoordinator
//
//  Created by Telman Yusifov on 18.05.25.
//

import UIKit

protocol PopularOffersTableViewCellDelegate {
    func didChoosePopularService(service: ServiceModel)
}

class PopularOffersTableViewCell: UITableViewCell {
    
    private var delegate: PopularOffersTableViewCellDelegate?
    
    private var offers: [ServiceModel]?
    
    private var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .leading
        view.distribution = .fillProportionally
        view.spacing = 8
        return view
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font  = UIFont(name: Fonts.interBold.rawValue, size: 22)
        label.text = "Populyar təkliflər"
        label.textColor = .black
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 4
        layout.sectionInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        layout.itemSize = .init(width: 200, height: 192)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsHorizontalScrollIndicator = false
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collectionView.register(PopularOfferCollectionViewCell.self, forCellWithReuseIdentifier: PopularOfferCollectionViewCell.identifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func subscribe(_ delegate: PopularOffersTableViewCellDelegate) {
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
        [titleLabel, collectionView].forEach(stackView.addArrangedSubview)
        
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(20)
            make.horizontalEdges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        
        collectionView.snp.makeConstraints { make in
            make.height.equalTo(192)
            make.horizontalEdges.equalToSuperview()
        }
    }
    
    struct Item {
        let offers: [ServiceModel]
    }
    
    func configure(item: Item) {
        self.offers = item.offers
        collectionView.reloadData()
    }
    
}

extension PopularOffersTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        offers?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularOfferCollectionViewCell.identifier, for: indexPath) as? PopularOfferCollectionViewCell else { return UICollectionViewCell() }
        let item = offers?[indexPath.row]
        cell.configure(item: .init(logo: item?.logo, name: item?.name, fromLanguage: item?.fromLanguage, toLanguage: item?.toLanguage))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let offer = offers?[indexPath.row] {
            delegate?.didChoosePopularService(service: offer)
        }
    }
}
