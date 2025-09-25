//
//  FancyButtonView.swift
//  Animation Challenge FINAL
//
//  Created by McKenzie, Cameron - Student on 9/25/25.
//

import SwiftUI

struct FancyButtonView: View {
    @State private var loading = false
    @State private var completed = false
    
    var body: some View {
        ZStack {
            // Original / Done Button
            if !loading && !completed {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.green)
                    .frame(width: 200, height: 60)
                    .overlay(
                        Text("Submit")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                    )
                    .onTapGesture {
                        startProcessing()
                    }
                    .transition(.scale)
            }
            
            // Processing Button
            if loading && !completed {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.blue)
                    .frame(width: 200, height: 60)
                    .overlay(
                        HStack(spacing: 10) {
                            Circle()
                                .trim(from: 0, to: 0.7)
                                .stroke(Color.white, lineWidth: 3)
                                .frame(width: 20, height: 20)
                                .rotationEffect(Angle(degrees: loading ? 360 : 0))
                                .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: loading)
                            
                            Text("Processing")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                        }
                    )
                    .transition(.scale)
            }
            
            // Completed Button
            if completed {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.red)
                    .frame(width: 200, height: 60)
                    .overlay(
                        Text("Done")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                    )
                    .transition(.scale)
            }
        }
        .animation(.spring(), value: loading)
        .animation(.spring(), value: completed)
    }
    
    private func startProcessing() {
        self.loading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.loading = false
            self.completed = true
        }
    }
}

#Preview {
    FancyButtonView()
}

#Preview {
    FancyButtonView()
}
