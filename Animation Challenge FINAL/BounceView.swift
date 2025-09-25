//
//  BounceView.swift
//  Animation Challenge FINAL
//
//  Created by McKenzie, Cameron - Student on 9/25/25.
//

import SwiftUI

struct BounceView: View {
    @State private var swing = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("clock")
                .resizable()
                .scaledToFill()
                .frame(width: 220, height: 220)
                .clipShape(Circle())
                .shadow(radius: 5)
                .rotationEffect(.degrees(swing ? 50 : -50), anchor: .top)
                .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: swing)
                .onAppear {
                    swing = true
                }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(white: 0.95))
        .edgesIgnoringSafeArea(.all)
    }
}

struct BounceView_Previews: PreviewProvider {
    static var previews: some View {
        BounceView()
    }
}


#Preview {
    BounceView()
}
