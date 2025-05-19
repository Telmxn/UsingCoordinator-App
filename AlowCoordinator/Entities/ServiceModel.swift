//
//  ServiceModel.swift
//  AlowCoordinator
//
//  Created by Telman Yusifov on 18.05.25.
//

import UIKit

struct ServiceModel {
    let logo: UIImage
    let name: String
    var fromLanguage: Language?
    var toLanguage: Language?
    let minPrice: Int
    let maxPrice: Int
    var price: Int?
}
