//
//  UploadFilesViewController.swift
//  AlowCoordinator
//
//  Created by Telman Yusifov on 19.05.25.
//

import UIKit

class UploadFilesViewController: BaseViewController {
    
    private let viewModel: UploadFilesViewModel
    
    private var service: ServiceModel?
    
    private var titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 24
        view.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
        return view
    }()
    
    private var titleStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .leading
        view.distribution = .fillProportionally
        return view
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Azərbaycan -> Ərəb"
        label.font = UIFont(name: Fonts.interBlack.rawValue, size: 28)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.interBlack.rawValue, size: 28)
        label.textColor = .brandBase
        return label
    }()
    
    private var uploadButtonView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 24
        view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        return view
    }()
    
    private var uploadButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sənəd yüklə", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.interBold.rawValue, size: 16)
        button.backgroundColor = .brandBase
        button.layer.cornerRadius = 28
        return button
    }()
    
    private var centerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        return view
    }()
    
    private var uploadFilesStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        view.alignment = .center
        view.distribution = .fillProportionally
        return view
    }()
    
    private var uploadFilesImageView: UIImageView = {
        let view = UIImageView()
        view.image = .uploadFiles
        return view
    }()
    
    private var uploadFilesTextStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 4
        view.distribution = .fillProportionally
        view.alignment = .center
        return view
    }()
    
    private var uploadFilesTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sənədləri yüklə"
        label.textColor = .black
        label.font = UIFont(name: Fonts.interMedium.rawValue, size: 18)
        return label
    }()
    
    private var uploadFilesSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Format: .jpeg, .png, .pdf"
        label.textColor = .onsurfaceSecondary
        label.font = UIFont(name: Fonts.interRegular.rawValue, size: 16)
        return label
    }()
    
    init(viewModel: UploadFilesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "3/3 mərhələ"
        changeNavigationBarStyle()
        setupUI()
        
        viewModel.fetchData { [weak self] service in
            self?.service = service
        }
        
        titleLabel.text = "\(service?.fromLanguage?.getLanguageName() ?? "") -> \(service?.toLanguage?.getLanguageName() ?? "")"
        priceLabel.text = "\(service?.price ?? 11) AZN"
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
        
        let bottomSafeAreaView = UIView()
        bottomSafeAreaView.backgroundColor = .white
        bottomSafeAreaView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomSafeAreaView)

        bottomSafeAreaView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setupUI() {
        view.addSubviews(titleView, centerView, uploadButtonView)
        titleView.addSubview(titleStackView)
        [titleLabel, priceLabel].forEach(titleStackView.addArrangedSubview)
        uploadButtonView.addSubview(uploadButton)
        
        centerView.addSubview(uploadFilesStackView)
        
        [uploadFilesImageView, uploadFilesTextStackView].forEach(uploadFilesStackView.addArrangedSubview)
        [uploadFilesTitleLabel, uploadFilesSubtitleLabel].forEach(uploadFilesTextStackView.addArrangedSubview)
        
        titleView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview()
        }
        
        titleStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
        
        centerView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(uploadButtonView.snp.top).offset(-4)
        }
        
        uploadButtonView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview()
        }
        
        uploadButton.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
            make.height.equalTo(56)
        }
        
        uploadFilesStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.horizontalEdges.equalToSuperview()
        }
    }
}
