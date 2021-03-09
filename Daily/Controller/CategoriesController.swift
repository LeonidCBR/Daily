//
//  CategoriesController.swift
//  Daily
//
//  Created by Яна Латышева on 07.06.2020.
//  Copyright © 2020 Motodolphin. All rights reserved.
//

import UIKit
import RealmSwift

class CategoriesController: BaseController {

    // MARK: - Properties
    
//    private let categoryCellIdentifier = "CategoryCell"
//    private let refreshControl = UIRefreshControl()
    private var notificationToken: NotificationToken?
    
    private var categories: Results<Category>?
    {
        didSet {
            print("DEBUG: - categories is changed")
            
            // be careful when trying remove index
            // it is a bad habit because reloadData reload refreshes whole context
            //categoriesTable.reloadData()
        }
    }
    /*
     try didShange
     */
    
        /*
     private var categories: [Category] =
        [ECategory(name: "Важные покупки", color: .red),
                                           ECategory(name: "Разное"),
                                           ECategory(name: "Поздравить", color: .blue)]
    */
    
    // MARK: - UI Properties
//    private let categoriesTable: UITableView = {
//        let tableView = UITableView()
//        tableView.backgroundColor = .mainBlue
//        tableView.separatorStyle = .none
//        return tableView
//    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        loadCategories()
        
    }
    
    /*
    override func viewDidAppear(_ animated: Bool) {

        // TODO: - implement observing
//        if shouldReloadData { tableView.realoadData() }

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    */
    
    deinit {
        notificationToken?.invalidate()
    }
    

    // MARK: - Methods
    
    private func configureUI() {
        
        headerLabel.text = "Категории"
        
        //navigationController?.hidesBarsOnSwipe = true
        //tabBarController?.hidesBottomBarWhenPushed = true
        tableView.allowsSelection = false

        
        // Register cells for events
        tableView.register(CategoryCell.self, forCellReuseIdentifier: K.Identifier.categoryCell)
        tableView.register(NewCategoryCell.self, forCellReuseIdentifier: K.Identifier.newCategoryCell)
        
        // Set up delegate
//        categoriesTable.delegate = self
//        categoriesTable.dataSource = self
        
        // Setup refresh control
        refreshControl = UIRefreshControl()
        refreshControl?.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        refreshControl?.attributedTitle = NSAttributedString(string: "Fetching categories...", attributes: .none)
        refreshControl?.addTarget(self, action: #selector(refreshCategories), for: .valueChanged)

        
  
        // Add table with categories
//        view.addSubview(categoriesTable)
        // safeAreaLayoutGuide
        // layoutMarginsGuide
//        categoriesTable.anchor(top: topImage.bottomAnchor,
//                               bottom: view.safeAreaLayoutGuide.bottomAnchor,
//                               leading: view.safeAreaLayoutGuide.leadingAnchor,
//                               trailing: view.safeAreaLayoutGuide.trailingAnchor)
        
        // Hide keyboard when tap out of TextFields
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        /*
         There could be issues if you are dealing with tableviews and adding this tap gesture, selecting the rows, didSelectRowAtIndex path could not be fired until pressed long.
         Solution:
         
            tap.cancelsTouchesInView = false
         
         */
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    private func loadCategories() {
        print("DEBUG: loading categories...")
        
        categories = PersistentManager.shared.fetchCategories()
        
        // Retain notificationToken as long as you want to observe
        // let notificationToken = categories?.observe { ...
        notificationToken = categories?.observe { (changes) in
            switch (changes) {
            case .initial: //break
                // Results are now populated and can be accessed without blocking the UI
                print("DEBUG: - let's populate tables view")
                self.tableView.reloadData()
                
            case .update(_, deletions: let deletions, insertions: let insertions, modifications: let modifications):
                
                // TODO: - remove it! Only for test
//                self.categoriesTable.reloadData()
//                return
                
                // Query results have changed.
                print("DEBUG: Deleted indices: ", deletions)
                print("DEBUG: Inserted indices: ", insertions)
                print("DEBUG: Modified modifications: ", modifications)
                
                
                // TODO: - Implenent modifications
                
                
                //self.categoriesTable.reloadData()
//                DEBUG: Deleted indices:  []
//                DEBUG: Inserted indices:  [0]
//                DEBUG: Modified modifications:  []
                
                // TODO: - fix
                // when trying to remove last row
                // an error occur: reaml's object return null
                

                for insertRow in insertions {
                    print("DEBUG: We want to insert at the [\(insertRow)] position")
                    let indexPath = IndexPath(row: insertRow, section: 0)
                    
                    //if self.categoriesTable.window == nil
                    if self.view.window == nil {
                        print("DEBUG: categoriesTables.window is null!")
//                        self.reloadOnViewDidAppear = true
                    } else {
                        self.tableView.beginUpdates()
                        self.tableView.insertRows(at: [indexPath], with: .none)
                        self.tableView.endUpdates()
                    }
                    
                    // TODO: - Fix problem with layout
                    /*
                     Warning once only: UITableView was told to layout its visible cells and other contents without being in the view hierarchy (the table view or one of its superviews has not been added to a window). This may cause bugs by forcing views inside the table view to load and perform layout without accurate information (e.g. table view bounds, trait collection, layout margins, safe area insets, etc), and will also cause unnecessary performance overhead due to extra layout passes. Make a symbolic breakpoint at UITableViewAlertForLayoutOutsideViewHierarchy to catch this in the debugger and see what caused this to occur, so you can avoid this action altogether if possible, or defer it until the table view has been added to a window. Table view: <UITableView: 0x7f7f7f83da00; frame = (0 150; 390 611); clipsToBounds = YES; gestureRecognizers = <NSArray: 0x60000123ea00>; layer = <CALayer: 0x600001c54300>; contentOffset: {0, 0}; contentSize: {390, 264}; adjustedContentInset: {0, 0, 0, 0}; dataSource: <Daily.CategoriesController: 0x7f7f7ec18000>>
                     */
                }
                
               
                
                
                
            case .error(let error):
                // An error occurred while opening the Realm file on the background worker thread
                fatalError("\(error)")
            }
        }
        
    
        // Later, when done observing
//        notificationToken?.invalidate()
        
        // TODO: - EXAMPLES
        
        // filter
        // someCategories = categories.filter("name = %@", "YAHOO")
        
        // modify
        // let category = categories[0]
        // try! realm.write {
        //      category.name = "new name"
        // }
    }
    
    // MARK: - Selectors
    
    @objc private func refreshCategories() {
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }
    
    /*
    @objc private func keyboardWillShow(notification: Notification) {
        print("DEBUG: keyboard will show")
        //let objSender = notification.object
        guard let userInfo = notification.userInfo, let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardFrame = keyboardSize.cgRectValue
        let keyboardHeight = keyboardSize.cgRectValue.height
        print("Keyboard's height is \(keyboardHeight)")
        categoriesTable.scrollRectToVisible(keyboardFrame, animated: true)
    }

    @objc private func keyboardWillHide(notification: Notification) {
        print("DEBUG: keyboard wll hide")
    
    }
    */
    
    
    // MARK: - Table view data source
    
    // numberOfRowsInSection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Number of row equals number of categories plus one for text field cell
        return (categories?.count ?? 0) + 1
    }
    
    // cellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Add the cell of new category to the bottom of the list
        if indexPath.row == (categories?.count ?? 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifier.newCategoryCell, for: indexPath)
            (cell as! NewCategoryCell).delegate = self
            return cell
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifier.categoryCell, for: indexPath) as! CategoryCell
        
        if let category = categories?[indexPath.row] {
            
            // TODO: - write func setText, setColor
            
            cell.categoryText.text = category.name
            cell.colorCircle.backgroundColor = category.color
        }
        return cell
    }
    
    // commit
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // Avoid deleting cell with TextFeild
        // TODO: - Consider to add a tap to the cell view and discard it
        guard indexPath.row < (categories?.count ?? 0) else { return }
        
        if editingStyle == .delete {
            guard let category = categories?[indexPath.row] else { return }
            do {
                try PersistentManager.shared.deleteCategory(category)
                
                tableView.beginUpdates()
                tableView.deleteRows(at: [indexPath], with: .fade)
                tableView.endUpdates()
            } catch {
                // TODO: - Show message
                print("DEBUG: - ERROR deleting category. \(error)")
            }
        }
    }
    
}



/*
extension CategoriesController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return categories?.count ?? 0
        return (categories?.count ?? 0) + 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Add the cell of new category to the bottom
        if indexPath.row == categories?.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifier.newCategoryCell, for: indexPath)
            (cell as! NewCategoryCell).delegate = self
            return cell
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifier.categoryCell, for: indexPath) as! CategoryCell
        
        if let category = categories?[indexPath.row] {
            
            // TODO: - write func setText, setColor
            
            cell.categoryText.text = category.name
            cell.colorCircle.backgroundColor = category.color
        }
//        cell.categoryText.text = categories[indexPath.row].name
//        cell.colorCircle.backgroundColor = categories[indexPath.row].color
        
        return cell
    }
    
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row == categories?.count {
//            return 50.0
//        } else {
//            return tableView.estimatedRowHeight
//        }
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("row[\(indexPath.row)] is selected")
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            // TODO: - Remove object from Realm
            guard let category = categories?[indexPath.row] else { return }
            
            
            do {
                try PersistentManager.shared.deleteCategory(category)
                
                tableView.beginUpdates()
                tableView.deleteRows(at: [indexPath], with: .fade)
                tableView.endUpdates()
                
//                try realm.write {
//                    realm.delete(category)
//                }
                
            } catch {
                // TODO: - Show message
                print("DEBUG: - ERROR deleting category. \(error)")
            }
            
            
            //categories.remove(at: indexPath.row)
            
            
        }        
    }
    
}
*/

// MARK: - NETextCellDelegate
extension CategoriesController: NewCategoryCellDelegate {
    
    func didEndEditing(_ textCell: NewCategoryCell, withTextField textField: UITextField) {
        guard let newText = textField.text, !newText.isEmpty else { return }
        
        // Save category
        print("DEBUG: Save category \(newText)")
        do {
            let newCategory = Category(name: newText)
            try PersistentManager.shared.addCategory(newCategory)
            textCell.clearTextField()

        } catch {
            // TODO: - Show error message
            print("DEBUG: ERROR saving context: \(error)")
        }
    }
    
    /*
    func didBeginEditing(_ textCell: NewCategoryCell, withTextField textField: UITextField) {
        print("DEBUG: - \(#function)")
        guard let inputAccessoryViewHeight = textField.inputAccessoryView?.frame.height else {
            print("DEBUG: inputAccessoryView is nil!")
            return
        }
        
        print("Height = \(inputAccessoryViewHeight)")
    }
    

    func textChanged(_ textCell: NewCategoryCell, withTextField textField: UITextField, newText: String) {
        // try to scroll
//        var contentOffset = categoriesTable.contentOffset
//        print("Offset is \(contentOffset.y)")
//        contentOffset.y += 200
//        categoriesTable.setContentOffset(contentOffset, animated: true)
//        return
        
        guard !newText.isEmpty else { return }
        
        // save category
        print("DEBUG: save category \(newText)")
        do {
            let newCategory = Category(name: newText)
            try PersistentManager.shared.addCategory(newCategory)
            textCell.clearTextField()

        } catch {
            // TODO: - Show error message
            print("DEBUG: ERROR saving context: \(error)")
        }
    }
*/
}
