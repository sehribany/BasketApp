//
//  ViewController.swift
//  marketapp
//
//  Created by Şehriban Yıldırım on 17.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var uruncollectionview: UICollectionView!
    
    var data:[Data] = [] {
        didSet{
            self.uruncollectionview.reloadData()
        }
    }
    
    
    @IBAction func sepetbutton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SepetViewController") as! SepetViewController
        
        vc.urunSayisi = self.urunSayisi
        vc.urunPrice = self.urunPrice
        vc.urunName = self.urunName
        vc.image = self.image
        self.navigationController?.pushViewController(vc, animated: true)
    }
   
    
    var image: UIImageView?
    var urunName: String?
    var urunPrice:Double?
    var urunSayisi:Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        VeriAl()
    }
    
    func VeriAl() {
        let url = URL(string: "https://i.tmgrup.com.tr/mulakat/get-liste.json")
        WebService().productDownload(url: url!) { (urunler) in
            if let urunler = urunler {
                DispatchQueue.main.async {
                    self.data = urunler
                    ProductViewModel.shared.data = urunler
                    self.uruncollectionview.dataSource = self
                    self.uruncollectionview.delegate = self
                    self.uruncollectionview.reloadData()
                }
                
            }
        }
    }
}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
   

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "urunhucre", for: indexPath) as! urunhucre
        let productViewModel = data[indexPath.row]
        cell.urunname.text = productViewModel.name
        
        let imageURL = URL(string: productViewModel.imageUrl)
        URLSession.shared.dataTask(with: imageURL!){ data, response, error in
            if let data = data {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    cell.urunimage.image = image
            }
            }
            
        }.resume()
        
        cell.sepetButton.tag = indexPath.row
        cell.urunimage.image = UIImage(named: productViewModel.imageUrl)
        cell.configure(stok: productViewModel.stock)
        cell.urunprice.text = String(productViewModel.price)
        cell.stepper.tag = indexPath.row
        return cell
    }

}

    

