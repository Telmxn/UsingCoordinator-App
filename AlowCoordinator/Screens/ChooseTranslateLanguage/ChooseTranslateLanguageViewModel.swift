//
//  ChooseTranslateLanguageViewModel.swift
//  AlowCoordinator
//
//  Created by Telman Yusifov on 19.05.25.
//

import Foundation

class ChooseTranslateLanguageViewModel {
    
    private let inputData: ChooseTranslateLanguageInputData
    
    private let coordinator: AppCoordinator
    
    init(inputData: ChooseTranslateLanguageInputData, coordinator: AppCoordinator) {
        self.inputData = inputData
        self.coordinator = coordinator
    }
    
    func fetchData(completion: (ServiceModel) -> ()) {
        completion(inputData.service)
    }
    
    func navigateToUploadFiles(with service: ServiceModel) {
        let inputData = UploadFilesInputData(service: service)
        coordinator.navigateToUploadFilesVC(with: inputData)
    }
}
