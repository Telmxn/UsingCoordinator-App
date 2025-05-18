//
//  HomeViewController.swift
//  AlowCoordinator
//
//  Created by Telman Yusifov on 18.05.25.
//

import UIKit

class HomeViewController: BaseViewController {
    
    private var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

