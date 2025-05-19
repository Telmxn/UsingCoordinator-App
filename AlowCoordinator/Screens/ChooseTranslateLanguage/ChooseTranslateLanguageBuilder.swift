//
//  ChooseTranslateLanguageBuilder.swift
//  AlowCoordinator
//
//  Created by Telman Yusifov on 19.05.25.
//

import UIKit

class ChooseTranslateLanguageBuilder {
    
    private let coordinator: AppCoordinator
    private let inputData: ChooseTranslateLanguageInputData
    
    init(inputData: ChooseTranslateLanguageInputData, coordinator: AppCoordinator) {
        self.coordinator = coordinator
        self.inputData = inputData
    }
    
    func build() -> UIViewController {
        let viewModel = ChooseTranslateLanguageViewModel(inputData: inputData, coordinator: coordinator)
        let vc = ChooseTranslateLanguageViewController(viewModel: viewModel)
        return vc
    }
}
