//
//  CategoryCell.swift
//  Daily
//
//  Created by Яна Латышева on 11.06.2020.
//  Copyright © 2020 Motodolphin. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    // MARK: - Properties
    static let circleR = 5
    
    let colorCircle: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = CGFloat(circleR)
        return view
    }()
    
    let categoryText: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        addSubview(colorCircle)
        colorCircle.anchor(leading: leadingAnchor, paddingLeading: 20,
                           width: CGFloat(EventCell.circleR * 2), height: CGFloat(EventCell.circleR * 2),
                           centerY: centerYAnchor)
        
        addSubview(categoryText)
        categoryText.anchor(leading: colorCircle.trailingAnchor, paddingLeading: 20,
                         centerY: centerYAnchor)

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /*
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    */
}
