//
//  MainViewController.swift
//  Daily
//
//  Created by Яна Латышева on 21.03.2020.
//  Copyright © 2020 Motodolphin. All rights reserved.
//

import UIKit
import JTAppleCalendar


class HomeController: UIViewController {
    
    
    // MARK: - Create constants!!!
    
    
    
    // MARK: - Properties
//    private let headerIdentifier = "DateHeader"
//    private let calendarCellIdentifier = "DateCell"
//    private let eventCellIdentifier = "EventCell"
    
    private let headerHeight: CGFloat = 150.0
    
    private var events: [Event] = [
        Event(text: "test event 1", datetime: Date(),
              category: ECategory(name: "test cat", color: UIColor.blue)),
        Event(text: "посмотреть фильм", datetime: Date(),
              category: ECategory(name: "test cat 2", color: UIColor.red)),
        Event(text: "сделать что-нибудь хорошее", datetime: Date(),
              category: ECategory(name: "test cat", color: UIColor.blue))]
    
    private let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .medium
        df.timeStyle = .none
        df.locale = Locale(identifier: "ru_RU")
        
        // TODO: - разобраться, как выводить на экран название месяца в именительном падеже
        
        df.formattingContext = .standalone
        return df
    }()
    
    
    
    // MARK: - UI Properties
    private let topImage: UIImageView = {
        let imageView = UIImageView(image: .init(imageLiteralResourceName: "sky-640"))
//        imageView.backgroundColor = .white
        return imageView
    }()
   
    // Plus button
    private let newEventButton: UIButton = {
        let button = UIButton()
        /*
        let img = UIImageView(image: UIImage.init(systemName: "plus.circle")?.withRenderingMode(.alwaysOriginal))
        img.contentMode = .scaleAspectFill
        */
//        button.setImage(UIImage.init(systemName: "plus.circle"), for: .normal)
        button.setBackgroundImage(UIImage.init(systemName: "plus.circle"), for: .normal)
        button.tintColor = .mainBlue
        
        // v1
//        button.backgroundColor = .clear
//        button.layer.borderColor = UIColor.clear.cgColor
        // v2
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.white.cgColor
        
        button.layer.borderWidth = 3.0
        button.layer.cornerRadius = 20.0
        button.addTarget(self, action: #selector(addEvent), for: .touchUpInside)
        return button
    }()
    
    private let calendarView: JTACMonthView = {
        let calendar = JTACMonthView()
        calendar.backgroundColor = .clear
        calendar.scrollDirection = .horizontal
        calendar.scrollingMode = .stopAtEachCalendarFrame
        calendar.showsHorizontalScrollIndicator = false
        return calendar
    }()
    
    private let eventsTable: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .mainBlue
        tableView.separatorStyle = .none
//        tableView.allowsSelection = false
        return tableView
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        title = "Main"
        view.backgroundColor = .mainBlue
//        view.backgroundColor = UIColor(hexRGB: "#341f97")
        
        // Register cells for events
        eventsTable.register(EventCell.self, forCellReuseIdentifier: K.Identifier.eventCell)// eventCellIdentifier)
        
        // Set up delegate
        eventsTable.dataSource = self
        eventsTable.delegate = self
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addEvent))
        
        configureCalendar()
        
        setupView()
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // FOR TEST!!!
        newEventButton.sendActions(for: .touchUpInside)
        
        // Creating a constraint using NSLayoutConstraint
//        NSLayoutConstraint(item: calendarView,
//                           attribute: .height,
//                           relatedBy: .equal,
//                           toItem: nil,
//                           attribute: .width,
//                           multiplier: CGFloat(6) / CGFloat(7),
//            constant: CGFloat(headerHeight)).isActive = true
         
        // Creating the same constraint using constraintEqualToConstant:
        //button.widthAnchor.constraintEqualToConstant(40.0).active = true
        
        
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
         
        print("fr - \(newEventButton.frame.width)")
        print("b - \(newEventButton.bounds.width)")
        */
        //newEventButton.bounds.size.width += 40
        //print("Month label width = \(monthLabel.frame.width) and height = \(monthLabel.frame.height)")
    }
    
    
    // MARK: - Methods
    private func configureCalendar() {
        
        // Register cells for calendar
        calendarView.register(DateCell.self, forCellWithReuseIdentifier: K.Identifier.calendarCell) // calendarCellIdentifier)
        
        // Register header
        calendarView.register(DateHeader.self, forSupplementaryViewOfKind: JTACMonthView.elementKindSectionHeader, withReuseIdentifier: K.Identifier.calendarHeader) //headerIdentifier)
        
        // Set up delegate
        calendarView.calendarDelegate = self
        calendarView.calendarDataSource = self
        //calendarView.ibCalendarDelegate
        
        calendarView.minimumLineSpacing = 0
        calendarView.minimumInteritemSpacing = 0
        //calendarView.coordinateSpace // ???
        //calendarView.isUserInteractionEnabled = true
        //calendarView.contentInsetAdjustmentBehavior = .never
        
        // Scroll and select current date
        calendarView.scrollToDate(Date(), animateScroll: false)
        calendarView.selectDates( [ Date() ] )
    }
    
    
    private func setupView() {

        // Add top image
        view.addSubview(topImage)
        topImage.anchor(top: view.topAnchor,
                        leading: view.leadingAnchor,
                        trailing: view.trailingAnchor,
                        height: 150)
        
        // Add calendar
        view.addSubview(calendarView)
        calendarView.anchor(top: view.topAnchor,
                            leading: view.layoutMarginsGuide.leadingAnchor,
                            trailing: view.layoutMarginsGuide.trailingAnchor)
        
        // calculate height of calendarView
        // formula: <width> / <count-of-days-in-line> * <count-of-days-in-column> + <header-height>
        let countOfDaysInColumn: CGFloat = 6
        let countOfDaysInLine: CGFloat = 7
        NSLayoutConstraint(item: calendarView,
                       attribute: .height,
                       relatedBy: .equal,
                       toItem: view.layoutMarginsGuide,
                       attribute: .width,
                       multiplier: countOfDaysInColumn / countOfDaysInLine,
                       constant: CGFloat(headerHeight)).isActive = true
        
        // Add new event button
        view.addSubview(newEventButton)
        newEventButton.anchor(top: view.topAnchor, paddingTop: 55,
                              trailing: view.trailingAnchor, paddingTrailing: 20,
                              width: 40,
                              height: 40)
        
        // Add table with events
        view.addSubview(eventsTable)
        eventsTable.anchor(top: calendarView.bottomAnchor,
                           bottom: view.layoutMarginsGuide.bottomAnchor,
                           leading: view.layoutMarginsGuide.leadingAnchor,
                           trailing: view.layoutMarginsGuide.trailingAnchor)
        
    }

    
    @objc func addEvent() {
        present(NewEventController(), animated: true, completion: nil)
    }
    
    
    private func selectDate(_ date: Date) {
        dateFormatter.dateFormat = "dd-MM-yyyy"
        print("Selected date is \(dateFormatter.string(from: date))")
    }
    
}


// MARK: - JTACMonthViewDataSource
extension HomeController: JTACMonthViewDataSource {
    func configureCalendar(_ calendar: JTACMonthView) -> ConfigurationParameters {

        var dateDelta = DateComponents()
        
        // Subtrack years
        dateDelta.year = -5
        let startDate = Calendar.current.date(byAdding: dateDelta, to: Date()) ?? Date()
        
        // Add years
        dateDelta.year = 5
        let endDate = Calendar.current.date(byAdding: dateDelta, to: Date()) ?? Date()
        
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
extension HomeController: JTACMonthViewDelegate {
    
    func calendar(_ calendar: JTACMonthView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTACDayCell {
        
//        print("cell for item...")
        //cellState.dateBelongsTo
        //previousMonthOutsideBoundary
        //thisMonth
        //followingMonthOutsideBoundary
        
//        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: calendarCellIdentifier, for: indexPath) as! DateCell
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: K.Identifier.calendarCell, for: indexPath) as! DateCell
        
        // let's change the color of the current day
        dateFormatter.dateFormat = "dd-MM-yyyy"
        if dateFormatter.string(from: date) == dateFormatter.string(from: Date()) {
            cell.dateLabel.textColor = .black
            //cell.backgroundColor = .white
            /*
            let curDateBgView = UIView(frame: cell.frame)
            cell.addSubview(curDateBgView)
            curDateBgView.anchor(top: cell.topAnchor,
                                 bottom: cell.bottomAnchor,
                                 leading: cell.leadingAnchor,
                                 trailing: cell.trailingAnchor)
            print("frame height \(cell.frame.height)")
            curDateBgView.layer.cornerRadius = cell.frame.height / 2
            curDateBgView.backgroundColor = .green
            curDateBgView.layer.borderWidth = 5.0
            curDateBgView.layer.borderColor = UIColor.yellow.cgColor
            */
            
        } else {
            // because we use reusable cells we have to do this
            cell.dateLabel.textColor = .white
        }
        
        if cellState.dateBelongsTo == .thisMonth {
//            cell.dateLabel.textColor = .white
            cell.dateLabel.text = cellState.text
            
        } else {
//            cell.dateLabel.textColor = .lightGray
            cell.dateLabel.text = ""
//            cell.isSelected = false
        }
        
//        cell.dateLabel.textColor = .white
        
        //cell.isSelected = true
        
        
        
        /*
        if cellState.isSelected {
            cell.dateLabel.textColor = .mainBlue
            print("cell is selected")
        } else {
            cell.dateLabel.textColor = .white
        }
        */
        
        return cell
    }
    
    
    func calendar(_ calendar: JTACMonthView, willDisplay cell: JTACDayCell, forItemAt date: Date, cellState:
        CellState, indexPath: IndexPath) {
    
        // ????????
        
        print("will display...")
        
        let cell = cell as! DateCell
        cell.dateLabel.text = cellState.text
    }
    
    
    func calendar(_ calendar: JTACMonthView, shouldSelectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) -> Bool {
        
        if cellState.dateBelongsTo == .thisMonth {
            return true
        } else {
            return false
        }
    }
    
    
    func calendar(_ calendar: JTACMonthView, didSelectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) {

        selectDate(date)
        
    }
    
    /*
    func calendar(_ calendar: JTACMonthView, didDeselectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) {
        print("deselect \(cellState.text)")
    }
    */

    func calendar(_ calendar: JTACMonthView, headerViewForDateRange range: (start: Date, end: Date), at indexPath: IndexPath) -> JTACMonthReusableView {

        // When month is changed
        
//        let header = calendar.dequeueReusableJTAppleSupplementaryView(withReuseIdentifier: headerIdentifier, for: indexPath) as! DateHeader
        let header = calendar.dequeueReusableJTAppleSupplementaryView(withReuseIdentifier: K.Identifier.calendarHeader, for: indexPath) as! DateHeader
        
        dateFormatter.dateFormat = "MMMM"
        header.monthTitle.text = dateFormatter.string(from: range.start)
//        monthLabel.text = dateFormatter.string(from: range.start)
        
        dateFormatter.dateFormat = "yyyy"
        header.yearTitle.text = dateFormatter.string(from: range.start)
//        yearLabel.text = dateFormatter.string(from: range.start)
        
        return header
    }

    func calendarSizeForMonths(_ calendar: JTACMonthView?) -> MonthSize? {
        // set height for header with month
        return MonthSize(defaultSize: headerHeight)
    }
    
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension HomeController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        events.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: eventCellIdentifier, for: indexPath) as! EventCell
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifier.eventCell, for: indexPath) as! EventCell
        cell.eventText.text = events[indexPath.row].text
        cell.colorCircle.backgroundColor = events[indexPath.row].category.color
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("row[\(indexPath.row)] is selected")
    }

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            events.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

