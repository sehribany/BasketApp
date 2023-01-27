//
//  sepethucre.swift
//  marketapp
//
//  Created by Şehriban Yıldırım on 19.01.2023.
//

import UIKit

class sepethucre: UITableViewCell {

  
    @IBOutlet weak var sepeturunimage: UIImageView!
    
    @IBOutlet weak var sepeturunname: UILabel!
    
    @IBOutlet weak var sepeturunprice: UILabel!
    
    @IBOutlet weak var sepeturunsayisi: UILabel!
    
    @IBAction func sepetarttir(_ sender: UIStepper) {
        
        sepeturunsayisi.text = String(Int(sender.value))
    }
}
