//
//  APIManager.swift
//  WebSerivceDemo
//
//  Created by asmita.borawake on 29/03/18.
//  Copyright © 2018 asmita.borawake. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
class APIManager{
    
    static let sharedInstance = APIManager()
    private init(){
        
    }
    
    func getUserData(onCompliation:@escaping (JSON) -> Void)
    {
        
     let url = NSURL(string: fethch_users_url)
     var request = URLRequest(url: (url! as URL) as URL)
    
     request.httpMethod = "GET"
     request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
     Alamofire.request(request as URLRequestConvertible).responseJSON(){ response in
    
     switch response.result
     {
     case .success(let data):
     print(" data is",data)
    
   
    let response = JSON(data)
     onCompliation(response)
    case .failure(let error):
    print("fail to fecth data",error)
        onCompliation(nil)
    }
    }
      
  }
    
}
