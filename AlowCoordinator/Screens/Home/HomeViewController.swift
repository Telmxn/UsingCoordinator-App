//
//  HomeViewController.swift
//  AlowCoordinator
//
//  Created by Telman Yusifov on 18.05.25.
//

import UIKit

enum CellModels {
    case popularOffers(PopularOffersTableViewCell.Item)
    case services(ServicesTableViewCell.Item)
    case forYou(ForYouTableViewCell.Item)
}

class HomeViewController: BaseViewController {
    
    var cells: [CellModels] = []
    
    private var viewModel: HomeViewModel
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.dataSource = self
        view.delegate = self
        view.backgroundColor = .clear
        view.separatorStyle = .none
        view.allowsSelection = false
        return view
    }()
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(PopularOffersTableViewCell.self, forCellReuseIdentifier: PopularOffersTableViewCell.identifier)
        tableView.register(ServicesTableViewCell.self, forCellReuseIdentifier: ServicesTableViewCell.identifier)
        tableView.register(ForYouTableViewCell.self, forCellReuseIdentifier: ForYouTableViewCell.identifier)
        
        cells.append(.popularOffers(.init(offers: [
            .init(logo: .plane, name: "Səyahət sənədləri", fromLanguage: .az, toLanguage: .en, minPrice: 10, maxPrice: 30, price: (10...30).randomElement()),
            .init(logo: .graduationHat, name: "Təhsil sənədləri", fromLanguage: .en, toLanguage: .ru, minPrice: 10, maxPrice: 30, price: (10...30).randomElement())
        ])))
        
        cells.append(.services(.init(services: [
            .init(logo: .plane, name: "Pasport", fromLanguage: .az, toLanguage: .en, minPrice: 10, maxPrice: 30, price: (10...30).randomElement()),
            .init(logo: .graduationHat, name: "Şəxsiyyət vəsiqəsi", fromLanguage: .en, toLanguage: .ru, minPrice: 10, maxPrice: 30, price: (10...30).randomElement()),
            .init(logo: .plane, name: "Sürcülük vəsiqəsi", fromLanguage: .az, toLanguage: .en, minPrice: 10, maxPrice: 30, price: (10...30).randomElement()),
            .init(logo: .plane, name: "Pensiya vəsiqəsi ", fromLanguage: .az, toLanguage: .en, minPrice: 10, maxPrice: 30, price: (10...30).randomElement())
        ])))
        
        cells.append(.forYou(.init(offers: [
            .init(logo: .plane, name: "Şəxsiyyət vəsiqəsi", fromLanguage: .az, toLanguage: .tr, minPrice: 10, maxPrice: 30, price: (10...30).randomElement()),
            .init(logo: .graduationHat, name: "Arayış", fromLanguage: .ar, toLanguage: .tr, minPrice: 10, maxPrice: 30, price: (10...30).randomElement()),
            .init(logo: .plane, name: "Pensiya vəsiqəsi", fromLanguage: .ch, toLanguage: .az, minPrice: 10, maxPrice: 30, price: (10...30).randomElement())
        ])))
        
        tableView.reloadData()
        
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        changeNavigationBarStyle()
    }
    
    func changeNavigationBarStyle() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .clear
        appearance.shadowColor = nil

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = cells[indexPath.row]
        switch cellType {
        case .popularOffers(let data):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PopularOffersTableViewCell.identifier, for: indexPath) as? PopularOffersTableViewCell else { return UITableViewCell() }
            cell.subscribe(self)
            cell.configure(item: data)
            return cell
        case .services(let data):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ServicesTableViewCell.identifier, for: indexPath) as? ServicesTableViewCell else { return UITableViewCell() }
            cell.subscribe(self)
            cell.configure(item: data)
            return cell
        case .forYou(let data):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ForYouTableViewCell.identifier, for: indexPath) as? ForYouTableViewCell else { return UITableViewCell() }
            cell.subscribe(self)
            cell.configure(item: data)
            return cell
        }
    }
}

extension HomeViewController: ServicesTableViewCellDelegate {
    func didChooseService(service: ServiceModel) {
        viewModel.navigateToChooseFileLanguage(with: service)
    }
}

extension HomeViewController: PopularOffersTableViewCellDelegate {
    func didChoosePopularService(service: ServiceModel) {
        viewModel.navigateToUploadFiles(with: service)
    }
}

extension HomeViewController: ForYouTableViewCellDelegate {
    func didChooseForYouService(service: ServiceModel) {
        viewModel.navigateToUploadFiles(with: service)
    }
}
