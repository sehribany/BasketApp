//
//  ProductViewModel.swift
//  marketapp
//
//  Created by Şehriban Yıldırım on 18.01.2023.
//

import Foundation

struct ProductViewModel{
    
    static var shared = ProductViewModel()
    
    var data = [Data]()
    var basketData = [Data]()
}
