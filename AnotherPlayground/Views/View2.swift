//
//  View2.swift
//  AnotherPlayground
//
//  Created by Daniel Kamel on 30/09/2021.
//

import SwiftUI

struct View2: View {
    
    @StateObject var resultFetcher = ResultFetcher()
    
    var body: some View {
        Text(resultFetcher.clout.postFound?.body ?? "n/a")
    }
}

struct View2_Previews: PreviewProvider {
    static var previews: some View {
        View2()
    }
}
