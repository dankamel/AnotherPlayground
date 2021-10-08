//
//  View2.swift
//  AnotherPlayground
//
//  Created by Daniel Kamel on 30/09/2021.
//

import SwiftUI

struct View2: View {
    
    var resultFetcher = ResultFetcher()
    
    init(result: ResultFetcher) {
        self.resultFetcher = result
    }
    
    var body: some View {
        View3(result: resultFetcher)
    }
}

