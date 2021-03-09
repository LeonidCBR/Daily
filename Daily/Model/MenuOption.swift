//
//  MenuOption.swift
//  Daily
//
//  Created by Яна Латышева on 09.03.2021.
//  Copyright © 2021 Motodolphin. All rights reserved.
//

import UIKit

enum MenuOption: Int, CaseIterable, CustomStringConvertible {

    case Image
    
    var description: String {
        switch self {
        case .Image: return "Change main image"
        }
    }
    
    var image: UIImage {
        switch self {
        case .Image: return UIImage(systemName: "person")!
        }
    }
    
}
