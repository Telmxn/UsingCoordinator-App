//
//  ChooseTranslateLanguageViewController.swift
//  AlowCoordinator
//
//  Created by Telman Yusifov on 19.05.25.
//

import UIKit

class ChooseTranslateLanguageViewController: BaseViewController {
    
    private let viewModel: ChooseTranslateLanguageViewModel
    
    private var service: ServiceModel?
    
    private var titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 24
        view.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
        return view
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sənəd hansı dilə tərcümə olunacaq?"
        label.font = UIFont(name: Fonts.interBlack.rawValue, size: 28)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        view.separatorStyle = .none
        view.contentInset = UIEdgeInsets(top: 12,left: 0,bottom: 0,right: 0)
        
        return view
    }()
    
    init(viewModel: ChooseTranslateLanguageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "2/3 mərhələ"
        changeNavigationBarStyle()
        setupUI()
        
        tableView.register(LanguageTableViewCell.self, forCellReuseIdentifier: LanguageTableViewCell.identifier)
        
        viewModel.fetchData { [weak self] service in
            self?.service = service
        }
    }
    
    func changeNavigationBarStyle() {
        self.navigationController?.navigationBar.topItem?.backButtonTitle = ""
        let backButton = UIBarButtonItem(image: .stayHere, style: .done, target: self, action: #selector(goBack))
        backButton.tintColor = .surfaceSecondary
        navigationItem.leftBarButtonItem = backButton
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.shadowColor = nil

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setupUI() {
        view.addSubviews(titleView, tableView)
        titleView.addSubviews(titleLabel)
        
        titleView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

extension ChooseTranslateLanguageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Language.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LanguageTableViewCell.identifier, for: indexPath) as? LanguageTableViewCell else { return UITableViewCell() }
        cell.configure(language: Language.allCases[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        service?.toLanguage = Language.allCases[indexPath.row]
        if let service = service {
            viewModel.navigateToUploadFiles(with: service)
        }
    }
}
