//
//  Language.swift
//  AlowCoordinator
//
//  Created by Telman Yusifov on 19.05.25.
//

import UIKit

enum Language: String, CaseIterable {
    case az = "AZ"
    case ru = "RU"
    case en = "EN"
    case tr = "TR"
    case ar = "AR"
    case jp = "JP"
    case ch = "CH"
    
    func getImage() -> UIImage {
        switch self {
        case .az:
            return .azerbaijan
        case .ru:
            return .russia
        case .en:
            return .uk
        case .tr:
            return .turkey
        case .ar:
            return .uae
        case .jp:
            return .japan
        case .ch:
            return .china
        }
    }
    
    func getFullName() -> String {
        switch self {
        case .az:
            return "Azərbaycanca"
        case .ru:
            return "Rusca"
        case .en:
            return "İngiliscə"
        case .tr:
            return "Türkcə"
        case .ar:
            return "Ərəbcə"
        case .jp:
            return "Yaponca"
        case .ch:
            return "Çincə"
        }
    }
    
    func getLanguageName() -> String {
        switch self {
        case .az:
            return "Azərbaycan"
        case .ru:
            return "Rus"
        case .en:
            return "İngilis"
        case .tr:
            return "Türk"
        case .ar:
            return "Ərəb"
        case .jp:
            return "Yapon"
        case .ch:
            return "Çin"
        }
    }
}
