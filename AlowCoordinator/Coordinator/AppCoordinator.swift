//
//  AppCoordinator.swift
//  AlowCoordinator
//
//  Created by Telman Yusifov on 18.05.25.
//

import UIKit

protocol Coordinator {
    func start()
}

class AppCoordinator: Coordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = HomeBuilder(coordinator: self).build()
        navigationController.setViewControllers([vc], animated: true)
    }
    
    func navigateToChooseFileLanguageVC(with inputdata: ChooseFileLanguageInputData) {
        let vc = ChooseFileLanguageBuilder(inputData: inputdata, coordinator: self).build()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func navigateToChooseTranslateLanguageVC(with inputdata: ChooseTranslateLanguageInputData) {
        let vc = ChooseTranslateLanguageBuilder(inputData: inputdata, coordinator: self).build()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func navigateToUploadFilesVC(with inputData: UploadFilesInputData) {
        let vc = UploadFilesBuilder(inputData: inputData, coordinator: self).build()
        navigationController.pushViewController(vc, animated: true)
    }
}
