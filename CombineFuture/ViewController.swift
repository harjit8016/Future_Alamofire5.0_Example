//
//  ViewController.swift
//  CombineFuture
//
//  Created by Harjit Singh on 04/05/20.
//  Copyright © 2020 Harjit Singh. All rights reserved.
//

import UIKit
import Combine
class ViewController: UIViewController {
    private var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let param = PostDataRegister.init(email: "mail2gary@gmail.com", password: "123", name: "MunnaBhai", age: 17)
        let strEndpoint = "http://dummy.restapiexample.com/api/v1/create"
        
        let result =  API.postApi(url: strEndpoint, param: param)
        
        result.sink(receiveCompletion: { (completion) in
            print(completion)
        }) { (dataObj) in
            
            print(dataObj.data?.name ?? "nilVal")
            
        }.store(in: &subscriptions)
        
        // Do any additional setup after loading the view.
    }
    
}

