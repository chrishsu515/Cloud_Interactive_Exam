//
//  TableViewController.swift
//  Cloud_Interactive_Exam
//
//  Created by Chris on 2021/3/17.
//

import UIKit

class TableViewController: UITableViewController {
    private var dataList = NSMutableArray()
    private var curDataCount = 0
//    let dataContainer = DataContainer()
    private let tableViewCellModel = TableViewCellModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let api = API()
        api.getPhotos { [self] (res) in
            
            dataList = NSMutableArray(array: res!)
            tableViewCellModel.dataList = dataList
            tableView.reloadData()
            tableView.isHidden = false
//            print(dataList.count / 4)
        }
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: Bundle(identifier: "indentityCell")), forCellReuseIdentifier: "indentityCell")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return dataList.count / 4
    }

  
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let table_width = tableView.frame.width
        let table_height = table_width / 4
//        print(table_height)
        return table_height
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "indentityCell", for: indexPath) as! TableViewCell

        curDataCount = indexPath.row * 4
        var curData = NSDictionary()
        curData = tableViewCellModel.getPhotoItem(index: curDataCount)
        cell.lblID1.text = String(describing: curData.value(forKey: "id")!)
        cell.lblTitle1.text = String(describing: curData.value(forKey: "title")!)
        tableViewCellModel.downLoadImage(url: String(describing: curData.value(forKey: "thumbnailUrl")!)) { (image) in
            cell.imgAlbum1.image = image
            cell.actIndicatorView1.stopAnimating()
        }
//        print(curData.value(forKey: "thumbnailUrl")!)
        curDataCount += 1

        curData = tableViewCellModel.getPhotoItem(index: curDataCount)
        cell.lblID2.text = String(describing: curData.value(forKey: "id")!)
        cell.lblTitle2.text = String(describing: curData.value(forKey: "title")!)
        tableViewCellModel.downLoadImage(url: String(describing: curData.value(forKey: "thumbnailUrl")!)) { (image) in
            cell.imgAlbum2.image = image
            cell.actIndicatorView2.stopAnimating()
        }
        curDataCount += 1
        
        curData = tableViewCellModel.getPhotoItem(index: curDataCount)
        cell.lblID3.text = String(describing: curData.value(forKey: "id")!)
        cell.lblTitle3.text = String(describing: curData.value(forKey: "title")!)
        tableViewCellModel.downLoadImage(url: String(describing: curData.value(forKey: "thumbnailUrl")!)) { (image) in
            cell.imgAlbum3.image = image
            cell.actIndicatorView3.stopAnimating()
        }
        curDataCount += 1
        
        curData = tableViewCellModel.getPhotoItem(index: curDataCount)
        cell.lblID4.text = String(describing: curData.value(forKey: "id")!)
        cell.lblTitle4.text = String(describing: curData.value(forKey: "title")!)
        tableViewCellModel.downLoadImage(url: String(describing: curData.value(forKey: "thumbnailUrl")!)) { (image) in
            cell.imgAlbum4.image = image
            cell.actIndicatorView4.stopAnimating()
        }
        curDataCount += 1


        return cell
    }
    

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
