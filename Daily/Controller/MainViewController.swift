//
//  MainViewController.swift
//  Daily
//
//  Created by Яна Латышева on 21.03.2020.
//  Copyright © 2020 Motodolphin. All rights reserved.
//

import UIKit
import JTAppleCalendar

class MainViewController: UIViewController {

    // MARK: - Properties
    private let cellIdentifier = "DateCell"
    private let headerIdentifier = "DateHeader"
    
    let formatter = DateFormatter()
    
    private let monthView: JTACMonthView = {
        let calendar = JTACMonthView()
        calendar.backgroundColor = .white
        calendar.scrollDirection = .horizontal
        calendar.scrollingMode = .stopAtEachCalendarFrame
        calendar.showsHorizontalScrollIndicator = false
        return calendar
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print("init vc...")
        
        view.backgroundColor = .white
//        view.backgroundColor = UIColor(hexRGB: "#341f97")
        
        formatter.dateFormat = "MMM"
        
        // Register cell
        monthView.register(DateCell.self, forCellWithReuseIdentifier: cellIdentifier)
        monthView.register(DateHeader.self, forSupplementaryViewOfKind: JTACMonthView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        
        // Set up delegate
        monthView.calendarDelegate = self
        monthView.calendarDataSource = self
        //monthView.ibCalendarDelegate
        
        
        // !!!
//        monthView.contentInsetAdjustmentBehavior = .never
        
        
        
        // Add month view
        view.addSubview(monthView)
        monthView.anchor(top: view.topAnchor,
                         paddingTop: 30,
                         leading: view.leadingAnchor,
                         trailing: view.trailingAnchor,
                         height: view.frame.width / 7 * 6 + 50) // 50 - height of header
        monthView.minimumLineSpacing = 0
        monthView.minimumInteritemSpacing = 0
        //monthView.isUserInteractionEnabled = true
    }


}


// MARK: - JTACMonthViewDataSource
extension MainViewController: JTACMonthViewDataSource {
    func configureCalendar(_ calendar: JTACMonthView) -> ConfigurationParameters {
        
//        print("configure calendar")
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        let startDate = formatter.date(from: "2020 01 01")!
        let endDate = Date()
        
        /*
        //calendar: calendar,
        let config = ConfigurationParameters(startDate: startDate,
                                       endDate: endDate,
                                       numberOfRows: 6,
                                       generateInDates: .forFirstMonthOnly,
                                       generateOutDates: .off,
                                       firstDayOfWeek: .monday,
                                       hasStrictBoundaries: false)
        */
        let config = ConfigurationParameters(startDate: startDate,
                                       endDate: endDate,
                                       firstDayOfWeek: .monday)
        
        return config
    }
    

}


// MARK: - JTACMonthViewDelegate

extension MainViewController: JTACMonthViewDelegate {
    
    func calendar(_ calendar: JTACMonthView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTACDayCell {
        
//        print("cell for item...")
        //cellState.dateBelongsTo
        //previousMonthOutsideBoundary
        //thisMonth
        //followingMonthOutsideBoundary
        
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! DateCell
        
        if cellState.dateBelongsTo == .thisMonth {
//            cell.dateLabel.textColor = .white
            cell.dateLabel.text = cellState.text
            
        } else {
//            cell.dateLabel.textColor = .lightGray
            cell.dateLabel.text = ""
//            cell.isSelected = false
        }
        
        
        
        //cell.isSelected = true
        
        
        
        /*
        if cellState.isSelected {
            cell.dateLabel.textColor = .systemTeal
            print("cell is selected")
        } else {
            cell.dateLabel.textColor = .white
        }
        */
        
        return cell
    }
    
    
    func calendar(_ calendar: JTACMonthView, willDisplay cell: JTACDayCell, forItemAt date: Date, cellState:
        CellState, indexPath: IndexPath) {
        
        print("will display...")
        
        let cell = cell as! DateCell
        cell.dateLabel.text = cellState.text
    }
    
    
    func calendar(_ calendar: JTACMonthView, didSelectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) {
        let cell = cell as! DateCell
        print("trying to select day: \(cell.dateLabel.text!)")
        
        cell.dateLabel.textColor = .white
        
        /*
        if cell.dateLabel.text == "" {
            
            // it doesn`t work
            cell.isSelected = false
        }
//        cellState.isSelected = false
        print(cellState.isSelected)
        //cell.view
        */
    }

    
    func calendar(_ calendar: JTACMonthView, headerViewForDateRange range: (start: Date, end: Date), at indexPath: IndexPath) -> JTACMonthReusableView {

        print("header")
        let header = calendar.dequeueReusableJTAppleSupplementaryView(withReuseIdentifier: headerIdentifier, for: indexPath) as! DateHeader
        header.monthTitle.text = formatter.string(from: range.start)
        print("return header -> \(header.monthTitle.text)")
        return header
    }
    
    func calendarSizeForMonths(_ calendar: JTACMonthView?) -> MonthSize? {
        return MonthSize(defaultSize: 50)
    }
    
}

