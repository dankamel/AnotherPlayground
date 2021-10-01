//
//  ContentView.swift
//  AnotherPlayground
//
//  Created by Daniel Kamel on 30/09/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var resultFetcher = ResultFetcher()
    
    @State var text = ""
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                Spacer()
                
                TextField("Paste Clout Hexcode Here", text: $text)
                    .font(.title2)
                    .padding()
                    .onChange(of: text) { text in
                        resultFetcher.updateData(postHashHex: text)
                    }
                
                Spacer()
                
                Text(resultFetcher.clout.postFound?.body ?? "n/a")
                
                Spacer()
                
                NavigationLink(
                    destination: View2(), label: {
                        
                        Text("Press me to go to next view")
                        
                    })
             
               Spacer()
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
