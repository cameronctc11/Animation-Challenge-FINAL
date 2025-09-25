//
//  AsymmetricView.swift
//  Animation Challenge FINAL
//
//  Created by McKenzie, Cameron - Student on 9/25/25.
//

import SwiftUI

struct AsymmetricView: View {
    @State private var show = false
    
    var body: some View {
        VStack(spacing: 40) {


            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 300)
                .foregroundStyle(.green)
                .overlay(
                    Text("Show details")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundStyle(.white)
                )
                .onTapGesture {
                    withAnimation(.spring()) {
                        show.toggle()
                    }
                }
            
            if show {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 300)
                    .foregroundStyle(.purple)
                    .overlay(
                        Text("Well, here is the details")
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                            .foregroundStyle(.white)
                    )
                    .transition(.scaleAndOffset)
            }
        }
        .onTapGesture {
            withAnimation(.spring()){
                self.show.toggle()
            }
        }
    }
}

extension AnyTransition {
    static var ScaleAndOffset: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .scale(scale: 0, anchor: .bottom),
            removal: .offset(x: -600, y: 00)
        )
    }
}
struct AsymmetricView_Previews: PreviewProvider {
    static var previews: some View {
        AsymmetricView()
    }
}

#Preview {
    AsymmetricView()
}
