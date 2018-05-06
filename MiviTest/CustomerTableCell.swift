//
//  CustomerTableCell.swift
//  MiviTest
//
//  Created by RajkumarThyadi on 5/6/18.
//  Copyright © 2018 RajkumarThyadi. All rights reserved.
//

import UIKit

class CustomerTableCell: UITableViewCell {
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var lblTitle1: UILabel!
    @IBOutlet weak var lblTitle2: UILabel!
    @IBOutlet weak var lblTitle3 : UILabel!
    @IBOutlet weak var lblTitle4 : UILabel!
    @IBOutlet weak var lblValue1 : UILabel!
    @IBOutlet weak var lblValue2 : UILabel!
    @IBOutlet weak var lblValue3 : UILabel!
    @IBOutlet weak var lblValue4 : UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
