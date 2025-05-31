//
//  LoadingView.swift
//  Appetizers
//
//  Created by Mesum Syed on 29/05/2025.
//

import Foundation
import SwiftUI

struct ActivityIndicator: UIViewRepresentable{
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = AppColors.brandPrimaryUIKit
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
   
}

struct LoadingView: View{
    var body: some View{
        ZStack{
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            ActivityIndicator()
        }
    }
}
