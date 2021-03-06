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
//    private let imageView = UIImageView(image: .init(imageLiteralResourceName: "sky-640"))
    
    let monthTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana-Bold", size: 25.0)
        label.textAlignment = .center
        label.clipsToBounds = true
//        label.textColor = .mainBlue
//        label.backgroundColor = .white
//        label.layer.cornerRadius = 20.0
        label.textColor = .white
        
        
        //label.layer.borderWidth = 3.0
        //label.layer.borderColor = UIColor.red.cgColor
        return label
    }()
    
    let yearTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Verdana-Bold", size: 20.0)
        label.textAlignment = .center
        return label
    }()

    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
//        addSubview(imageView)
//        imageView.anchor(top: topAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor)
        
        addSubview(monthTitle)
//        monthTitle.anchor(centerX: centerXAnchor, centerY: centerYAnchor)
        monthTitle.anchor(width: 150, height: 40,
                          centerX: centerXAnchor, centerY: centerYAnchor)
        
        addSubview(yearTitle)
        yearTitle.anchor(leading: leadingAnchor, paddingLeading: 0,
                         centerY: centerYAnchor)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
