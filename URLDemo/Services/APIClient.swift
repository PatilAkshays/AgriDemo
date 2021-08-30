//
//  APIClient.swift
//  URLDemo
//
//  Created by Manish Ingale on 30/08/21.
//

import Foundation
import Alamofire
import AlamofireObjectMapper




final class APIClient {
    static var shared = APIClient()
    private init(){
        
    }
    
    private let baseUrl = "https://fakestoreapi.com/products"
   
   //MARK: Get API Data
    func agriApiRequestWith(completionHandler: @escaping ([AgriModel], ValidationResult) -> Void){
        let url = "\(baseUrl)"
        
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
        
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default, headers: headers).responseArray(completionHandler: { (response: DataResponse<[AgriModel]>) in
            switch(response.result){
            case .success:
                completionHandler(response.result.value!, ValidationResult(success: true, errorMessage: nil))
            case .failure(let error):
                print("Error ",error)
                let apiErrorResponse = [AgriModel]()
                completionHandler(apiErrorResponse, ValidationResult(success: false, errorMessage: "\(error)"))
            }
            
        })

      
    }
    
  
}
