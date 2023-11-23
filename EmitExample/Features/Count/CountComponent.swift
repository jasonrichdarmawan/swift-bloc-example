//
//  CountComponent.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 23/11/23.
//

import SwiftUI

struct CountComponent: View {
    @Binding var count: Int
    
    var onDecrement: (() -> Void)?
    var onIncrement: (() -> Void)?
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Count")
            
            HStack(spacing: 8) {
                Button {
                    onDecrement?()
                } label: {
                    Image(systemName: "minus.circle")
                }
                
                Text("\(count)")
                
                Button {
                    onIncrement?()
                } label: {
                    Image(systemName: "plus.circle")
                }
            }
        }
        .padding(.all, 16)
        .border(.secondary)
    }
}

#Preview {
    struct Container: View {
        
        @State var count = 0
        
        var body: some View {
            CountComponent(
                count: $count,
                onDecrement: {
                    count -= 1
                },
                onIncrement: {
                    count += 1
                }
            )
        }
    }
    
    return Container()
}
