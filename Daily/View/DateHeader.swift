//
//  DateHeader.swift
//  Daily
//
//  Created by Яна Латышева on 30.03.2020.
//  Copyright © 2020 Motodolphin. All rights reserved.
//

import UIKit
import JTAppleCalendar

class DateHeader: JTACMonthReusableView {

    // MARK: - Properties
    let monthTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()

    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemTeal
        
        addSubview(monthTitle)
        monthTitle.anchor(centerX: centerXAnchor, centerY: centerYAnchor)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
