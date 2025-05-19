//
//  HomeViewModel.swift
//  AlowCoordinator
//
//  Created by Telman Yusifov on 18.05.25.
//

import Foundation

class HomeViewModel {
    
    private let coordinator: AppCoordinator
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func navigateToChooseFileLanguage(with service: ServiceModel) {
        let inputData = ChooseFileLanguageInputData(service: service)
        coordinator.navigateToChooseFileLanguageVC(with: inputData)
    }
    
    func navigateToUploadFiles(with service: ServiceModel) {
        let inputData = UploadFilesInputData(service: service)
        coordinator.navigateToUploadFilesVC(with: inputData)
    }
}
