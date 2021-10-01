//
//  ResultFetcher.swift
//  AnotherPlayground
//
//  Created by Daniel Kamel on 30/09/2021.
//

import SwiftUI

class ResultFetcher: ObservableObject {
    
    @Published var clout = Cloutington()
    @Published var dataHasLoaded = false
    private let initialPostHashHex: String = "77601b28ae670ab6fad425eb6bf76b9ea0c85a348863054c5abe98a3f1bae979"
    
    init () {
        
        updateData(postHashHex: initialPostHashHex)
        
    }
    
    
    func updateData(postHashHex: String) {
        getData(postHashHex: postHashHex) { clout in
            self.clout = clout
        }
    }
    
    private func getData(postHashHex: String, completion: @escaping (Cloutington) -> ()) {
        
        let parameters =  "{\r\n \"PostHashHex\": \"\(postHashHex)\"\r\n}"
        let postData = parameters.data(using: .utf8)
        var request =  URLRequest(url: URL(string: "https://bitclout.com/api/v0/get-single-post")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = postData
        request.httpMethod = "POST"
        
        let task =  URLSession.shared.dataTask(with: request) { (responseData, response, error) in
            
            print(error)
            print(response)
            print(responseData)
            
            if let resData = responseData {
                let decoder = JSONDecoder()
                
                do
                {
                    let finalData = try decoder.decode(Cloutington.self, from: resData)
                    DispatchQueue.main.async {
                        
                        completion(finalData)
                        self.dataHasLoaded = true
                        
                    }
                    
                }
                catch (let error)
                {
                    print(error)
                }
                
            }
            
        }
        task.resume()
        
    }
    
}
