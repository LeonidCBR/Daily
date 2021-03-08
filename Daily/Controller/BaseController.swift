//
//  BaseController.swift
//  Daily
//
//  Created by Яна Латышева on 07.02.2021.
//  Copyright © 2021 Motodolphin. All rights reserved.
//

import UIKit

/**
 This is a parent class
 */

class BaseController: UITableViewController {
    
    // MARK: - Properties
    
    let headerImageView: UIImageView = {
        let iv = UIImageView(image: .init(imageLiteralResourceName: "sky-640"))
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainBlue
//        additionalSafeAreaInsets = .zero
        tableView.contentInset = .zero
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
        
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerImageView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return K.Height.headerImage
    }

//    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}




    
    
    
    /*UIViewController {

    // MARK: - Properties
    let topImage: UIImageView = {
        let imageView = UIImageView(image: .init(imageLiteralResourceName: "sky-640"))
        return imageView
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
//        label.text = "Настройки"
        label.textColor = .white
        label.font = UIFont(name: "Verdana-Bold", size: 25.0)
        label.textAlignment = .center
        return label
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .mainBlue
        //        view.backgroundColor = UIColor(hexRGB: "#341f97")
        
        configureUI()
    }
    

    // MARK: - Methods
    private func configureUI() {
        // Add top image
        view.addSubview(topImage)
        topImage.anchor(top: view.topAnchor,
                        leading: view.leadingAnchor,
                        trailing: view.trailingAnchor,
                        height: 150)
        
        // Add month label
        topImage.addSubview(headerLabel)
        //top: topImage.topAnchor, paddingTop: 50,
        headerLabel.anchor(centerX: topImage.centerXAnchor,
                           centerY: topImage.centerYAnchor)
    }

}
*/
