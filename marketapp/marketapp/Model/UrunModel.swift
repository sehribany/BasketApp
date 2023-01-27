//
//  UrunModel.swift
//  marketapp
//
//  Created by Şehriban Yıldırım on 18.01.2023.
//

import Foundation

struct Urun : Codable{
    let data : [Data]
}
struct Data : Codable {
    
    let id : String
    let name : String
    let price : Double
    let currency : String
    let imageUrl : String
    let stock : Int
    
    var urunsayi : Int? = 0
    
}
