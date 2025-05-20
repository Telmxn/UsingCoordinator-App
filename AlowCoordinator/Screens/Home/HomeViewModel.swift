//
//  HomeViewModel.swift
//  AlowCoordinator
//
//  Created by Telman Yusifov on 18.05.25.
//

import Foundation

class HomeViewModel {
    
    private var dataArray: [CellModels] = []
    
    private let coordinator: AppCoordinator
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func fetchData(completion: ([CellModels])->()) {
        dataArray.append(.popularOffers(.init(offers: [
            .init(logo: .plane, name: "Səyahət sənədləri", fromLanguage: .az, toLanguage: .en, minPrice: 10, maxPrice: 30, price: (10...30).randomElement()),
            .init(logo: .graduationHat, name: "Təhsil sənədləri", fromLanguage: .en, toLanguage: .ru, minPrice: 10, maxPrice: 30, price: (10...30).randomElement())
        ])))
        
        dataArray.append(.services(.init(services: [
            .init(logo: .plane, name: "Pasport", fromLanguage: .az, toLanguage: .en, minPrice: 10, maxPrice: 30, price: (10...30).randomElement()),
            .init(logo: .graduationHat, name: "Şəxsiyyət vəsiqəsi", fromLanguage: .en, toLanguage: .ru, minPrice: 10, maxPrice: 30, price: (10...30).randomElement()),
            .init(logo: .plane, name: "Sürcülük vəsiqəsi", fromLanguage: .az, toLanguage: .en, minPrice: 10, maxPrice: 30, price: (10...30).randomElement()),
            .init(logo: .plane, name: "Pensiya vəsiqəsi ", fromLanguage: .az, toLanguage: .en, minPrice: 10, maxPrice: 30, price: (10...30).randomElement())
        ])))
        
        dataArray.append(.forYou(.init(offers: [
            .init(logo: .plane, name: "Şəxsiyyət vəsiqəsi", fromLanguage: .az, toLanguage: .tr, minPrice: 10, maxPrice: 30, price: (10...30).randomElement()),
            .init(logo: .graduationHat, name: "Arayış", fromLanguage: .ar, toLanguage: .tr, minPrice: 10, maxPrice: 30, price: (10...30).randomElement()),
            .init(logo: .plane, name: "Pensiya vəsiqəsi", fromLanguage: .ch, toLanguage: .az, minPrice: 10, maxPrice: 30, price: (10...30).randomElement())
        ])))
        completion(dataArray)
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
