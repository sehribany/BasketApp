//
//  SepetViewController.swift
//  marketapp
//
//  Created by Şehriban Yıldırım on 20.01.2023.
//

import UIKit

class SepetViewController: UIViewController {
    
    @IBOutlet weak var Sepettableview: UITableView!
    

    @IBOutlet weak var toplamtutar: UILabel!
    
    var image: UIImageView?
    var urunName: String?
    var urunPrice:Double?
    var urunSayisi:Int?
    
    var labelData = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Sepettableview.dataSource = self
        Sepettableview.delegate = self
        
    }
    
}

extension SepetViewController: UITableViewDelegate, UITableViewDataSource{
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProductViewModel.shared.basketData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "sepethucre", for: indexPath) as! sepethucre
        let data = ProductViewModel.shared.basketData[indexPath.row]
        cell.sepeturunname.text = data.name
        cell.sepeturunprice.text = String(data.price)
        cell.sepeturunsayisi.text = String(data.urunsayi ?? 0)
        
            toplamtutar.text = "Toplam Tutar : \(Double(data.urunsayi ?? 0) * Double(data.price) ) TL"
            
        let imageURL = URL(string: data.imageUrl)
        URLSession.shared.dataTask(with: imageURL!){ data, response, error in
            if let data = data{
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    cell.sepeturunimage.image = image
                }
            }
        }.resume()
        return cell
    }
}
