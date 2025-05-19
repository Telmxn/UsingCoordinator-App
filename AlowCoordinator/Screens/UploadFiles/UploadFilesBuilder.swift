//
//  UploadFilesBuilder.swift
//  AlowCoordinator
//
//  Created by Telman Yusifov on 19.05.25.
//

import UIKit

class UploadFilesBuilder {
    
    private let coordinator: AppCoordinator
    private let inputData: UploadFilesInputData
    
    init(inputData: UploadFilesInputData, coordinator: AppCoordinator) {
        self.coordinator = coordinator
        self.inputData = inputData
    }
    
    func build() -> UIViewController {
        let viewModel = UploadFilesViewModel(inputData: inputData, coordinator: coordinator)
        let vc = UploadFilesViewController(viewModel: viewModel)
        return vc
    }
}
