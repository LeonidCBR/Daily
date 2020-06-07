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
    
    private let topImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let monthLabel: UILabel = {
        let label = UILabel()
        label.text = "MONTH"
        return label
    }()
    
    private let newEventButton: UIButton = {
        let button = UIButton()
        button.setImage(.add, for: .normal)
//        button.tintColor = .red
//        button.backgroundColor = .systemPink
        button.addTarget(self, action: #selector(addEvent), for: .touchUpInside)
        return button
    }()
    
    private let calendarView: JTACMonthView = {
        let calendar = JTACMonthView()
        calendar.backgroundColor = .white
        calendar.scrollDirection = .horizontal
        calendar.scrollingMode = .stopAtEachCalendarFrame
        calendar.showsHorizontalScrollIndicator = false
        return calendar
    }()
    
    private let eventsTable: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemTeal
        return tableView
    }()
    
    let formatter = DateFormatter()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print("init vc...")
        
//        title = "Main"
        view.backgroundColor = .systemTeal
//        view.backgroundColor = UIColor(hexRGB: "#341f97")
        
        formatter.dateFormat = "MMM"
        
        // Register cell
        calendarView.register(DateCell.self, forCellWithReuseIdentifier: cellIdentifier)
        calendarView.register(DateHeader.self, forSupplementaryViewOfKind: JTACMonthView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        
        // Set up delegate
        calendarView.calendarDelegate = self
        calendarView.calendarDataSource = self
        //calendarView.ibCalendarDelegate
        
        
        // !!!
//        calendarView.contentInsetAdjustmentBehavior = .never
        
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addEvent))
        
        
        setupView()
                
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /*
         // safe area расчитывается после того, как окно загрузится и покажется на экране
         
        print(view.safeAreaLayoutGuide.layoutFrame.width)
        print(view.safeAreaLayoutGuide.layoutFrame.height)
        print(view.safeAreaInsets.left)
        print(view.safeAreaInsets.bottom)
        print(view.safeAreaInsets.top)
        print("top margin \(view.layoutMargins.top)")
        print("left margin \(view.layoutMargins.left)")
        print("margin width \(view.layoutMarginsGuide.layoutFrame.width)")
        print("view width \(view.frame.width)")
        print("margin height \(view.layoutMarginsGuide.layoutFrame.height)")
        print("view height \(view.frame.height)")
        */
    }
    
    
    // MARK: - Methods
    private func setupView() {

        // Add top image
        view.addSubview(topImage)
        topImage.anchor(top: view.topAnchor,
                        leading: view.leadingAnchor,
                        trailing: view.trailingAnchor,
                        height: 150)
        
        // Add month label
        topImage.addSubview(monthLabel)
        monthLabel.anchor(top: topImage.topAnchor, paddingTop: 50,
                          centerX: topImage.centerXAnchor)
        
        // Add new event button
        view.addSubview(newEventButton)
        newEventButton.anchor(top: view.topAnchor, paddingTop: 50,
                              trailing: view.trailingAnchor, paddingTrailing: 20,
                              width: 25,
                              height: 25)
        
        // Add calendar
        view.addSubview(calendarView)
        //was -> view.topAnchor, paddingTop: 0,
        //margins.topAnchor
        
        calendarView.anchor(top: topImage.bottomAnchor, // view.layoutMarginsGuide.topAnchor,
                         leading: view.leadingAnchor, paddingLeading: 20,
                         trailing: view.trailingAnchor, paddingTrailing: 20,
                         height: (view.layoutMarginsGuide.layoutFrame.width - 40) / 7 * 6 + 50)
        // 40 - left padding + right padding
        // 7 - count of days in a line
        // 6 - count of days in a column
        // 50 - height of header
        
        calendarView.minimumLineSpacing = 0
        calendarView.minimumInteritemSpacing = 0
        //calendarView.isUserInteractionEnabled = true
        
        
        // Add table with events
        view.addSubview(eventsTable)
        eventsTable.anchor(top: calendarView.bottomAnchor, paddingTop: 0,
                           bottom: view.layoutMarginsGuide.bottomAnchor, paddingBottom: 0,
                           leading: view.leadingAnchor, paddingLeading: 20,
                           trailing: view.trailingAnchor, paddingTrailing: 20)
        
    }

    @objc func addEvent() {
        print("add new event")
        present(NewEventController(), animated: true, completion: nil)
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

//        print("header")
        let header = calendar.dequeueReusableJTAppleSupplementaryView(withReuseIdentifier: headerIdentifier, for: indexPath) as! DateHeader
        header.monthTitle.text = formatter.string(from: range.start)
//        print("return header -> \(header.monthTitle.text)")
        return header
    }
    
    func calendarSizeForMonths(_ calendar: JTACMonthView?) -> MonthSize? {
        return MonthSize(defaultSize: 50)
    }
    
}

