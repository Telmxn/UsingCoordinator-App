//
//  ChooseFileLanguageBuilder.swift
//  AlowCoordinator
//
//  Created by Telman Yusifov on 18.05.25.
//

import UIKit

class ChooseFileLanguageBuilder {
    
    private let coordinator: AppCoordinator
    private let inputData: ChooseFileLanguageInputData
    
    init(inputData: ChooseFileLanguageInputData, coordinator: AppCoordinator) {
        self.coordinator = coordinator
        self.inputData = inputData
    }
    
    func build() -> UIViewController {
        let viewModel = ChooseFileLanguageViewModel(inputData: inputData, coordinator: coordinator)
        let vc = ChooseFileLanguageViewController(viewModel: viewModel)
        return vc
    }
}
