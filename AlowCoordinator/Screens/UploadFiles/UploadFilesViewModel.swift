//
//  UploadFilesViewModel.swift
//  AlowCoordinator
//
//  Created by Telman Yusifov on 19.05.25.
//

import Foundation

class UploadFilesViewModel {
    
    private let inputData: UploadFilesInputData
    
    private let coordinator: AppCoordinator
    
    init(inputData: UploadFilesInputData, coordinator: AppCoordinator) {
        self.inputData = inputData
        self.coordinator = coordinator
    }
    
    func fetchData(completion: (ServiceModel) -> ()) {
        completion(inputData.service)
    }
}
