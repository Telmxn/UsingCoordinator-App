//
//  HomeBuilder.swift
//  AlowCoordinator
//
//  Created by Telman Yusifov on 18.05.25.
//

import UIKit

final class HomeBuilder {
    
    func build() -> UIViewController {
        let viewModel = HomeViewModel()
        let vc = HomeViewController(viewModel: viewModel)
        return vc
    }
}
