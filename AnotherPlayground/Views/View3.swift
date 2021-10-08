//
//  View3.swift
//  AnotherPlayground
//
//  Created by Daniel Kamel on 02/10/2021.
//

import SwiftUI

extension String {
    
    func NewLoad() -> UIImage {
        
        do {
            
            guard let url = URL(string: self) else {
                
                return UIImage()
                
            }
            
            let data: Data = try Data(contentsOf: url)
            
            return UIImage(data: data) ?? UIImage()
        } catch {
            
        }
        
        return UIImage()
        
    }
    
}

struct View3: View {
    
    var resultFetcher = ResultFetcher()
    
    init(result: ResultFetcher) {
        self.resultFetcher = result
    }
    
    var body: some View {
        
        VStack {
            
            Text(resultFetcher.clout.postFound?.body ?? "")
                .padding(.horizontal)
            
            
            //Why doesn't the image load into the view?
            Image(uiImage: "\(resultFetcher.clout.postFound?.imageURLs ?? [])".NewLoad())
            
        }
        
        
        
    }
}

struct View3_Previews: PreviewProvider {
    static var previews: some View {
        View3(result: ResultFetcher())
    }
}
