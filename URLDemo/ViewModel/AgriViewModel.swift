//
//  AgriViewModel.swift
//  URLDemo
//
//  Created by Manish Ingale on 30/08/21.
//

import Foundation


class AgriViewModel {
    
    var getAgriApiResponse = [AgriModel]()

    //MARK: request for Agri data
    func requestAgriApiData(completion: @escaping ([AgriModel], ValidationResult ) -> Void) {
        
        APIClient.shared.agriApiRequestWith { (response, result) in
            DispatchQueue.main.async {
                self.getAgriApiResponse = response
                if result.success {
                    //Success
                    
                }
                completion(self.getAgriApiResponse, result)
            }
        }
        
    }
    
}
