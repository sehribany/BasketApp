//
//  WebService.swift
//  marketapp
//
//  Created by Şehriban Yıldırım on 18.01.2023.
//

import Foundation

class WebService {
    
    func productDownload(url : URL, completion : @escaping ([Data]?) -> ()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                
            }else if let data = data{
                
                let urundizisi = try? JSONDecoder().decode(Urun.self, from: data)
                
                if let urundizisi = urundizisi{
                    completion(urundizisi.data)
                }
                
            }
        }.resume()
    }
}
