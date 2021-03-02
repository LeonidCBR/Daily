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
    private let categoryCellIdentifier = "CategoryCell"
    private let refreshControl = UIRefreshControl()
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
    private let categoriesTable: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .mainBlue
        tableView.separatorStyle = .none
        return tableView
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        loadCategories()
        
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//
//        // TODO: - implement observing
//        if shouldReloadData { tableView.realoadData() }
//
//    }
    
    deinit {
        notificationToken?.invalidate()
    }
    

    // MARK: - Methods
    
    private func configureUI() {
        
        headerLabel.text = "Категории"
        
        // Register cells for events
        categoriesTable.register(CategoryCell.self, forCellReuseIdentifier: categoryCellIdentifier)
        
        // Set up delegate
        categoriesTable.delegate = self
        categoriesTable.dataSource = self
        
        refreshControl.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching categories...", attributes: .none)
        refreshControl.addTarget(self, action: #selector(refreshCategories), for: .valueChanged)
        categoriesTable.refreshControl = refreshControl
        
  
        // Add table with categories
        view.addSubview(categoriesTable)
        // safeAreaLayoutGuide
        // layoutMarginsGuide
        categoriesTable.anchor(top: topImage.bottomAnchor,
                               bottom: view.safeAreaLayoutGuide.bottomAnchor,
                               leading: view.safeAreaLayoutGuide.leadingAnchor,
                               trailing: view.safeAreaLayoutGuide.trailingAnchor)
        
    }
    
    private func loadCategories() {
        print("DEBUG: loading categories...")
        
        // TODO: - find out why it does not refresh!!!
        
//        categories = realm.objects(Category.self)
        categories = PersistentManager.shared.fetchCategories()
        
        // Retain notificationToken as long as you want to observe
        // let notificationToken = categories?.observe { ...
        notificationToken = categories?.observe { (changes) in
            switch (changes) {
            case .initial: //break
                // Results are now populated and can be accessed without blocking the UI
                print("DEBUG: - let's populate tables view")
                self.categoriesTable.reloadData()
                
            case .update(_, deletions: let deletions, insertions: let insertions, modifications: let modifications):
                
                // TODO: - remove it! Only for test
//                self.categoriesTable.reloadData()
//                return
                
                // Query results have changed.
                print("DEBUG: Deleted indices: ", deletions)
                print("DEBUG: Inserted indices: ", insertions)
                print("DEBUG: Modified modifications: ", modifications)
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
                    if self.categoriesTable.window == nil {
                        print("DEBUG: categoriesTables.window is null!")
//                        self.reloadOnViewDidAppear = true
                    } else {
                        self.categoriesTable.beginUpdates()
                        self.categoriesTable.insertRows(at: [indexPath], with: .none)
                        self.categoriesTable.endUpdates()
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
        categoriesTable.reloadData()
        refreshControl.endRefreshing()
    }

}


// MARK: - UITableViewDelegate, UITableViewDataSource

extension CategoriesController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: categoryCellIdentifier, for: indexPath) as! CategoryCell
        
        if let category = categories?[indexPath.row] {
            
            // TODO: - write func setText, setColor
            
            cell.categoryText.text = category.name
            cell.colorCircle.backgroundColor = category.color
        }
//        cell.categoryText.text = categories[indexPath.row].name
//        cell.colorCircle.backgroundColor = categories[indexPath.row].color
        
        return cell
    }
    
    
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
