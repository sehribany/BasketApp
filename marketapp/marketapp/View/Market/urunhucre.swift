//
//  urunhucre.swift
//  marketapp
//
//  Created by Şehriban Yıldırım on 17.01.2023.
//

import UIKit

class urunhucre: UICollectionViewCell {
    
    @IBOutlet weak var sepetButton: UIButton!
    
    @IBOutlet weak var urunimage: UIImageView!
    
    @IBOutlet weak var urunname: UILabel!
    
    @IBOutlet weak var urunprice: UILabel!
    
    @IBOutlet weak var urunsayisi: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    

    
    var stok: Int?

    
    @IBAction func arttir(_ sender: UIStepper){
        urunsayisi.text = String(Int(sender.value))
        ProductViewModel.shared.data[sender.tag].urunsayi = Int(sender.value)
        if ProductViewModel.shared.basketData.count != 0{
            for i in 0...ProductViewModel.shared.basketData.count - 1{
                if ProductViewModel.shared.data[sender.tag].id == ProductViewModel.shared.basketData[i].id{
                    ProductViewModel.shared.basketData[i].urunsayi = Int(sender.value)
                }
            }
        }
        
        if(stok == Int(sender.value)){
            stepper.minimumValue = 0
            stepper.maximumValue = Double(stok!)
        }
    }
    
    func configure(stok: Int) {
        self.stok = stok
    }
    
    
    @IBAction func sepetekle(_ sender: UIButton) {
        ProductViewModel.shared.basketData.append(ProductViewModel.shared.data[sender.tag])
    }
    

}
