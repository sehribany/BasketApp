//
//  Urunler.swift
//  marketapp
//
//  Created by Şehriban Yıldırım on 17.01.2023.
//

import Foundation

class Urunler{
    
    var urunId:Int?
    var urunBaslik:String?
    var urunResimAdi:String?
    var urunFiyat:Double?
    
    init(){
        
    }
    
    init(urunId: Int, urunBaslik: String, urunResimAdi: String, urunFiyat: Double) {
        self.urunId = urunId
        self.urunBaslik = urunBaslik
        self.urunResimAdi = urunResimAdi
        self.urunFiyat = urunFiyat
    }
}
