//
//  PopularOffersTableViewCell.swift
//  AlowCoordinator
//
//  Created by Telman Yusifov on 18.05.25.
//

import UIKit

class PopularOffersTableViewCell: UITableViewCell {
    
    private var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 8
        return view
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font  = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white
        layer.cornerRadius = 24
    }
    
}
