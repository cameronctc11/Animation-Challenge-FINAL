//
//  SwiftUIView.swift
//  Animation Challenge FINAL
//
//  Created by McKenzie, Cameron - Student on 9/25/25.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack(spacing: 60) {
            // Circle Loading Indicator
            LoadingCircleView()
            
            // Rectangle Loading Indicator
            RectangleLoadingView()
        }
        .padding()
    }
}


struct LoadingCircleView: View {
    @State private var isLoading = false
    
    var body: some View {
        Circle()
            .trim(from: 0, to: 0.7)
            .stroke(Color.green, lineWidth: 5)
            .frame(width: 100, height: 100)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: isLoading)
            .onAppear {
                isLoading = true
            }
    }
}



struct RectangleLoadingView: View {
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            Text("Loading")
                .font(.system(.body, design: .rounded))
                .bold()
                .offset(y: -25)
            
            RoundedRectangle(cornerRadius: 3)
                .stroke(Color(.systemGray5), lineWidth: 3)
                .frame(width: 250, height: 3)
            
            RoundedRectangle(cornerRadius: 3)
                .stroke(Color.green, lineWidth: 3)
                .frame(width: 30, height: 3)
                .offset(x: isLoading ? 110 : -110)
                .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: isLoading)
        }
        .onAppear {
            isLoading = true
        }
    }
}
#Preview {
    SwiftUIView()
}
