//
//  EmptyState.swift
//  Appetizers
//
//  Created by Mesum Syed on 09/06/2025.
//

import SwiftUI

struct EmptyState: View {
    let imageName: String
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Image("empty-order")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                
                Text("Default Message")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
                    
            }
        }
    }
}

#Preview {
    EmptyState(imageName: "empty-order")
}
