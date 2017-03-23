//
//  SearchItemDetailViewController.swift
//  AmazingGifters
//
//  Created by Chong Wu Guo on 7/5/16.
//  Copyright © 2016 Kai Lu. All rights reserved.
//

import UIKit

class SearchItemDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var itemImage: UIImageView!

    @IBAction func pickThisAction(_ sender: AnyObject) {
        let n: Int! = self.navigationController?.viewControllers.count
        if let addGiftController = self.navigationController?.viewControllers[n-3] as? AddGiftTableViewContonller{
            addGiftController.searchItem = itemDic
            addGiftController.picked = true
            self.navigationController?.popToViewController(addGiftController, animated: true)
        }
    }
    @IBAction func openURLAction(_ sender: UIButton) {
        UIApplication.shared.openURL(URL(string: itemDic["viewItemURL"] as! String)!)
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var openURLButton: UIButton!
    var itemDic = NSMutableDictionary()
    
    var table = [String]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let url = URL(string: itemDic["galleryURL"] as! NSString as String)
        let data = try? Data(contentsOf: url!)
        itemImage.contentMode = .scaleAspectFit
        itemImage.image = UIImage(data: data!)
        table.append(itemDic["itemId"] as! String)
        table.append(itemDic["title"] as! String)
        table.append(itemDic["convertedCurrentPrice"] as! String)
        tableView.rowHeight = UITableViewAutomaticDimension

        self.tableView.reloadData()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        print("testing333")

        print(table.count)
        return table.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "itemMenuCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SearchItemDetailTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        cell.rightLabel?.text = table[indexPath.row]
        switch indexPath.row {
            case 0:
                cell.leftLabel.text = "Item ID"
                print("lable1")
            case 1:
                cell.leftLabel.text = "Item Name"
               // cell.rightLabel.numberOfLines = 3
                print("lable2")
            case 2:
                cell.leftLabel.text = "Price"
                cell.leftLabel.sizeToFit()
                tableView.rowHeight = UITableViewAutomaticDimension
                print("lable3")
            default:  print(indexPath.row)
        
        }
        print("testing")
        print(cell.rightLabel?.text)
        return cell
    }
    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        if indexPath.row == 1 {
//            print("testinggg")
//            print(UITableViewAutomaticDimension)
//            return UITableViewAutomaticDimension
//        } else {
//            return UITableViewAutomaticDimension
//        }
//    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}
