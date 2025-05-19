//
//  HomeBuilder.swift
//  AlowCoordinator
//
//  Created by Telman Yusifov on 18.05.25.
//

import UIKit

final class HomeBuilder {
    
    private let coordinator: AppCoordinator
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func build() -> UIViewController {
        let viewModel = HomeViewModel(coordinator: coordinator)
        let vc = HomeViewController(viewModel: viewModel)
        return vc
    }
}
