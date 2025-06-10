//
//  EmptyState.swift
//  Appetizers
//
//  Created by Mesum Syed on 09/06/2025.
//

import SwiftUI

struct EmptyState: View {
    let imageName: String
    let message: String
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea(.all)
            
            VStack{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .padding()
                
                Text(message)
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
    EmptyState(imageName: "empty-order", message: "This is a test message i am making it a little longer to see how it wraps.")
}
