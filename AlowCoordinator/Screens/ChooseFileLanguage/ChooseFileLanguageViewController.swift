//
//  ChooseUploadFileLanguageViewController.swift
//  AlowCoordinator
//
//  Created by Telman Yusifov on 18.05.25.
//

import UIKit

class ChooseUploadFileLanguageViewController: BaseViewController {
    
    private let viewModel: ChooseUploadFileLanguageViewModel
    
    init(viewModel: ChooseUploadFileLanguageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
