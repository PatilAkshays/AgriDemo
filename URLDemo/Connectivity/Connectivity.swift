//
//  Connectivity.swift
//  URLDemo
//
//  Created by Manish Ingale on 30/08/21.
//

import Foundation
import Alamofire

class Connectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

