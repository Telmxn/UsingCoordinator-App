//
//  ChooseFileLanguageViewModel.swift
//  AlowCoordinator
//
//  Created by Telman Yusifov on 18.05.25.
//

import Foundation

class ChooseFileLanguageViewModel {
    
    private let inputData: ChooseFileLanguageInputData
    
    private let coordinator: AppCoordinator
    
    init(inputData: ChooseFileLanguageInputData, coordinator: AppCoordinator) {
        self.inputData = inputData
        self.coordinator = coordinator
    }
    
    func fetchData(completion: (ServiceModel) -> ()) {
        completion(inputData.service)
    }
    
    func navigateToChooseTranslateLanguage(with service: ServiceModel) {
        let inputData = ChooseTranslateLanguageInputData(service: service)
        coordinator.navigateToChooseTranslateLanguageVC(with: inputData)
    }
}
