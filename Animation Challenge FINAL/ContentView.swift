//
//  ContentView.swift
//  Animation Challenge FINAL
//
//  Created by McKenzie, Cameron - Student on 9/25/25.
//

import SwiftUI

struct ContentView: View {
    @State private var circleColorChanged = false
    @State private var heartColorChanged = false
    @State private var heartSizeChanged = false
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundStyle(circleColorChanged ? Color(.systemGray5) : .red)
            
            Image(systemName: "heart.fill")
                .foregroundStyle(heartColorChanged ? .red : .white)
                .font(.system(size: 100))
                .scaleEffect(heartSizeChanged ? 1.0 : 0.5)
        }
        .onTapGesture {
            withAnimation(.spring(.bouncy, blendDuration: 1.0)) {
                circleColorChanged.toggle()
                heartColorChanged.toggle()
                heartSizeChanged.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
