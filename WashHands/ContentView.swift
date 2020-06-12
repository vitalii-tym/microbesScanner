//
//  ContentView.swift
//  WashHands
//
//  Created by Vitaliy Tim on 30.05.2020.
//  Copyright © 2020 Vitalii Tymoshenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HandARView()
            VStack(alignment: .leading){
                HStack {
                    Text("Microbes")
                        .font(.title)
                        .fixedSize()
                    Spacer(minLength: 5)
                        }
                }
                Text("Wash you hands to see them disappear")
                    .font(.subheadline)
                HStack {
                    Spacer()
                    Button(action: {
                         print("test")
                    }) {
                        Text("Settings")
                            .foregroundColor(.purple)
                            .font(.headline)
                            .padding(EdgeInsets(top: 7, leading: 7, bottom: 7, trailing: 7))
                            .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.purple, lineWidth: 2)
                        )
                    }
                }
            }
            .padding()
        }
    }
    
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
