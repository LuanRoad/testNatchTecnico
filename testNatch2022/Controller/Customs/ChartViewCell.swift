//
//  ChartViewCell.swift
//  TestNach2022
//
//  Created by Luan Road on 21/04/22.
//

import UIKit

class ChartViewCell: UITableViewCell {

    @IBOutlet weak var lblPregunta: UILabel!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var label6: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        view1.layer.cornerRadius = view1.bounds.size.width / 2.0
//        view2.layer.cornerRadius = view2.bounds.size.width / 2.0
//        view3.layer.cornerRadius = view3.bounds.size.width / 2.0
//        view4.layer.cornerRadius = view4.bounds.size.width / 2.0
//        view5.layer.cornerRadius = view5.bounds.size.width / 2.0
//        view6.layer.cornerRadius = view6.bounds.size.width / 2.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
