//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Mesum Syed on 28/05/2025.
//

import SwiftUI

    struct AppetizerListCell: View {
        let appetizer: Appetizer
        
        var body: some View {
            HStack(spacing: 16){
//                Image("asian-flank-steak").resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 120, height: 90)
//                    .cornerRadius(8)
                
//                AsyncImage(url: URL(string: appetizer.imageURL)){ phase in
//                    switch phase {
//                    case .empty:
//                        ProgressView()
//                            .frame(width: 120, height: 90)
//                    case .success(let image):
//                        image
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 120, height: 90)
//                            .cornerRadius(8)
//                        
//                    case .failure(_):
//                        Image("photo").resizable()
//                            .scaledToFill()
//                            .frame(width: 120, height: 90)
//                            .foregroundColor(.gray)
//                        
//                        @unknown default:
//                        EmptyView()
//                    }
//    
//                }
                
                AppetizerRemoteImage(urlString: appetizer.imageURL)
                    .aspectRatio(contentMode: .fit)
                                      .frame(width: 120, height: 90)
                                      .cornerRadius(8)
                VStack(alignment: .leading, spacing: 5){
                    Text(appetizer.name)
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                    
                    Text(String(format: "$%.2f",appetizer.price))
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                    
                    
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal)
        }
    }


#Preview {
    AppetizerListCell(appetizer: MOCKDATA.sameplAppetizer)
}
