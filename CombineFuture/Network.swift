//
//  Network.swift
//  CombineFuture
//
//  Created by Harjit Singh on 04/05/20.
//  Copyright © 2020 Harjit Singh. All rights reserved.
//


struct PostDataRegister:Codable {
    var email:String?
    var password:String?
    var name:String?
    var age:Int?
    var id:Int? = 0
}

struct MainDataModel:Codable {
    var data:PostDataRegister?
    var status:String?
}

import Alamofire
import Combine

class API {
    
    static func postApi(url:String,param:PostDataRegister)->Future<MainDataModel,Error>{
        
        return Future<MainDataModel,Error> { promise in
            
            let encoder = JSONEncoder()
            
            let jsonEncoder =  JSONParameterEncoder(encoder: encoder)
            
            let request = AF.request(URL(string: url)!, method: .post, parameters: param ,encoder: jsonEncoder)
            
            request.validate()
            
            request.responseDecodable(of: MainDataModel.self) { (response) in
                switch response.result{
                case .failure(let Lerror):
                    print(Lerror)
                    promise(.failure(Lerror))
                    break
                case .success(let dataObj):
                    print(dataObj.data?.age ?? 0)
                    promise(.success(dataObj))
                    break
                }
                
            }
            
        }
        
    }
    
}
