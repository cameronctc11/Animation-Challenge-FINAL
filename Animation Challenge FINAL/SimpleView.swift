//
//  SimpleView.swift
//  Animation Challenge FINAL
//
//  Created by McKenzie, Cameron - Student on 9/25/25.
//

import SwiftUI

struct SimpleView: View {
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

                    .transition(.offset(x: -600, y: 0))             }
        }
        .padding()
    }
}

struct SimpleView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleView()
    }
}


#Preview {
    SimpleView()
}
