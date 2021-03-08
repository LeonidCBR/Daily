//
//  Constants.swift
//  Daily
//
//  Created by Яна Латышева on 27.07.2020.
//  Copyright © 2020 Motodolphin. All rights reserved.
//

import UIKit

struct K {

    struct HomeController {
        static let newEventButtonSize: CGFloat = 30.0 //40.0
    }
    
    struct Identifier {
        static let calendarHeader = "DateHeader"
        static let calendarCell = "DateCell"
        static let eventCell = "EventCell"
        
        static let textCell = "NETextCellIdentifier"
        static let labelsCell = "NELabelsCellIdentifier"
        static let pickerCell = "NEPickerCellIdentifier"
        static let datePickerCell = "NEDatePickerCellIdentifier"
        static let toggleCell = "NEToggleCellIdentifier"
        
        static let categoryCell = "CategoryCellIdentifier"
        static let newCategoryCell = "NewCategoryCellIdentifier"
    }
    
    struct TabBarItem {
        static let home = "Календарь"
        static let categories = "Категории"
        static let settings = "Настройки"
    }
    
    struct Height {
        static let headerImage: CGFloat = 150.0
        
        // TODO: - Refactor
        static let rowDatePicker: CGFloat = 216.0
        static let rowPickerView: CGFloat = 150.0
        static let rowTextField: CGFloat = 60.0
        static let row: CGFloat = 43.5
    }
}



