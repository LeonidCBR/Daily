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

    
    // TODO: - DO NOT allow select a blank day
    
    
    // MARK: - Properties
    private let calendarCellIdentifier = "DateCell"
    private let headerIdentifier = "DateHeader"
    private let eventsCellIdentifier = "EventCell"
    
    private let headerHeight: CGFloat = 150.0
    
    private var events = [Event]()
    
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
        imageView.backgroundColor = .white
        return imageView
    }()
    
    /*
    private let monthLabel: UILabel = {
        let label = UILabel()
//        label.text = "MONTH"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20.0)
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .systemTeal
        label.clipsToBounds = true
//        label.layer.borderWidth = 3.0
//        label.layer.borderColor = UIColor.red.cgColor
        label.layer.cornerRadius = 20.0
        return label
    }()
    
    private let yearLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
        label.textAlignment = .center
        label.textColor = .white
//        label.backgroundColor = .systemTeal
//        label.clipsToBounds = true
        //        label.layer.borderWidth = 3.0
        //        label.layer.borderColor = UIColor.red.cgColor
//        label.layer.cornerRadius = 20.0
        return label
    }()
    */
    
   
    private let newEventButton: UIButton = {
        let button = UIButton()
        /*
        let img = UIImageView(image: UIImage.init(systemName: "plus.circle")?.withRenderingMode(.alwaysOriginal))
        img.contentMode = .scaleAspectFill
        img.tintColor = .red
        button.imageView = img
        */
//        button.setImage(UIImage.init(systemName: "plus.circle"), for: .normal)
//        button.backgroundColor = .systemPink
        button.setBackgroundImage(UIImage.init(systemName: "plus.circle"), for: .normal)
        button.tintColor = .white
        
        // v1
//        button.backgroundColor = .clear
//        button.layer.borderColor = UIColor.clear.cgColor
        // v2
        button.backgroundColor = .systemTeal
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
        tableView.backgroundColor = .systemTeal
        tableView.separatorStyle = .none
//        tableView.allowsSelection = false
        return tableView
    }()
    
    
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let testCategory = ECategory(name: "test cat", color: UIColor.blue)        
        events.append(Event(text: "test event 1", datetime: Date(), category: testCategory))
        events.append(Event(text: "посмотреть фильм", datetime: Date(), category: testCategory))
        events.append(Event(text: "сделать что-нибудь хорошее", datetime: Date(), category: testCategory))
        
//        title = "Main"
        view.backgroundColor = .systemTeal
//        view.backgroundColor = UIColor(hexRGB: "#341f97")
        
        /*
        // testing
        
        let dF = DateFormatter()
        dF.dateStyle = .medium
        dF.timeStyle = .none
         
        let d = Date(timeIntervalSinceReferenceDate: 118800)
         
        // US English Locale (en_US)
        dF.locale = Locale(identifier: "ru_RU")
        print(dF.string(from: d)) // Jan 2, 2001
        */

        
        
        // Register cells for events
        eventsTable.register(EventCell.self, forCellReuseIdentifier: eventsCellIdentifier)
        
        // Set up delegate
        eventsTable.dataSource = self
        eventsTable.delegate = self
        
        
        
        // !!!
//        calendarView.contentInsetAdjustmentBehavior = .never
        
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addEvent))
        
        configureCalendar()
        
        setupView()
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
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
        calendarView.register(DateCell.self, forCellWithReuseIdentifier: calendarCellIdentifier)
        
        // Register header
        calendarView.register(DateHeader.self, forSupplementaryViewOfKind: JTACMonthView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        
        // Set up delegate
        calendarView.calendarDelegate = self
        calendarView.calendarDataSource = self
        //calendarView.ibCalendarDelegate
        
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
        /*
        // Add month label
        topImage.addSubview(monthLabel)
        monthLabel.anchor(top: topImage.topAnchor, paddingTop: 50,
                          width: 100,
                          height: 35,
                          centerX: topImage.centerXAnchor)
        
        // Add year label
        topImage.addSubview(yearLabel)
        yearLabel.anchor(top: monthLabel.bottomAnchor, paddingTop: 10,
                        centerX: topImage.centerXAnchor)
        */
        
        // Add calendar
        view.addSubview(calendarView)
        calendarView.anchor(top: view.topAnchor,
                            leading: view.layoutMarginsGuide.leadingAnchor,
                            trailing: view.layoutMarginsGuide.trailingAnchor)
        //                         leading: view.leadingAnchor, paddingLeading: 20,
        //                         trailing: view.trailingAnchor, paddingTrailing: 20,
        //                         height: (view.layoutMarginsGuide.layoutFrame.width - 40) / 7 * 6 + headerHeight)
        
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
      
        calendarView.minimumLineSpacing = 0
        calendarView.minimumInteritemSpacing = 0
        //calendarView.coordinateSpace // ???
        //calendarView.isUserInteractionEnabled = true
        
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
        print("add new event")
        present(NewEventController(), animated: true, completion: nil)
    }
    
    
    private func selectDate(_ date: Date) {
        
        dateFormatter.dateFormat = "dd-MM-yyyy"
        print("Selected date is \(dateFormatter.string(from: date))")
    }
    
}


// MARK: - JTACMonthViewDataSource
extension MainViewController: JTACMonthViewDataSource {
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
extension MainViewController: JTACMonthViewDelegate {
    
    func calendar(_ calendar: JTACMonthView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTACDayCell {
        
//        print("cell for item...")
        //cellState.dateBelongsTo
        //previousMonthOutsideBoundary
        //thisMonth
        //followingMonthOutsideBoundary
        
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: calendarCellIdentifier, for: indexPath) as! DateCell
        
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
        
        let header = calendar.dequeueReusableJTAppleSupplementaryView(withReuseIdentifier: headerIdentifier, for: indexPath) as! DateHeader
        
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
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: eventsCellIdentifier, for: indexPath) as! EventCell
        cell.eventText.text = events[indexPath.row].text
        cell.colorCircle.backgroundColor = events[indexPath.row].category.color
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("row[\(indexPath.row)] is selected")
    }

}

