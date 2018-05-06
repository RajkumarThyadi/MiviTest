//
//  CustomerViewController.swift
//  MiviTest
//
//  Created by RajkumarThyadi on 5/6/18.
//  Copyright © 2018 RajkumarThyadi. All rights reserved.
//

import UIKit

class CustomerViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblList: UITableView!
    var customerData : (data:NSDictionary,included:NSArray)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(customerData ?? "")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tblList.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerTableCellID", for: indexPath) as! CustomerTableCell
        return self.cellDataWrapper(indexpath: indexPath, cell: cell)
    }
    
    func cellDataWrapper(indexpath:IndexPath, cell:CustomerTableCell) -> CustomerTableCell{
        switch indexpath.row {
        case 0:
            if let data = self.customerData?.0 {
                cell.lblTitle1.text = "Name"
                cell.lblTitle2.text = "Payment Type"
                cell.lblTitle3.text = "Email"
                cell.lblTitle4.text = "Contact No."
                
                if let val = data["attributes"] as? NSDictionary {
                    cell.lblValue1.text = ((val.object(forKey: "first-name") ?? "") as! String) + ((val.object(forKey: "last-name") ?? "") as! String)
                    cell.lblValue2.text = ((val.object(forKey: "payment-type") ?? "") as! String)
                    cell.lblValue3.text = ((val.object(forKey: "email-address") ?? "") as! String)
                    cell.lblValue4.text = ((val.object(forKey: "contact-number") ?? "") as! String)
                }
            }
            
        case 1:
            if let dict = (self.customerData?.1[1] as? NSDictionary) {
                cell.lblTitle1.text = "Data Balance"
                cell.lblTitle2.text = "Expire Date"
                cell.lblTitle3.text = "Auto Renewal"
                cell.lblTitle4.text = "Primary"
                
                if let subDict = dict.object(forKey: "attributes") as? NSDictionary{
                    cell.lblValue1.text = String(describing: (subDict.object(forKey: "included-data-balance"))!)
                    cell.lblValue2.text = String(describing: (subDict.object(forKey: "expiry-date"))!)
                    cell.lblValue3.text = String(describing: ((subDict.object(forKey: "auto-renewal"))! as! NSNumber).boolValue)
                    cell.lblValue4.text = String(describing: ((subDict.object(forKey: "primary-subscription"))!as! NSNumber).boolValue)
                }
                
                
            }
        case 2 :
            if let dict = (self.customerData?.1[2] as? NSDictionary) {
                cell.lblTitle1.text = "Product Name"
                cell.lblTitle2.text = "Unlimited Text"
                cell.lblTitle3.text = "Unlimited Talk"
                cell.lblTitle4.text = "Price"
                
                if let subDict = dict.object(forKey: "attributes") as? NSDictionary{
                    cell.lblValue1.text = String(describing: (subDict.object(forKey: "name"))!)
                    cell.lblValue2.text = String(describing: ((subDict.object(forKey: "unlimited-text"))!as! NSNumber).boolValue)
                    cell.lblValue3.text = String(describing: ((subDict.object(forKey: "unlimited-talk"))!as! NSNumber).boolValue)
                    cell.lblValue4.text = String(describing: (subDict.object(forKey: "price"))!)
                }
            }
        default:
            return cell
        }
        return cell

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
