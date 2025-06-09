//  OrderDetailsView.swift
//  Appetizers

import SwiftUI

struct OrderDetailsView: View {
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    @EnvironmentObject var order: Order


    var body: some View {
        VStack(spacing: 16) {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 225)
                .clipped()
            
            
            Text(appetizer.name)
                .font(.title2)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            
            Text(appetizer.description)
                .font(.body)
                .foregroundColor(.secondary)
                .padding(.horizontal, 16)
                .multilineTextAlignment(.center)
            
            HStack(spacing: 40) {
                
                NutritionInfo(title: "Calories", value: appetizer.calories)
                
                NutritionInfo(title: "Carbs", value: appetizer.carbs)
                
                NutritionInfo(title: "Protein", value: appetizer.protein)
                
            } 
            
            Spacer()

            FinalPriceButton(appetizer: appetizer)
                .environmentObject(order)

                }
                .frame(width: 300, height: 525)
                .background(Color(.systemBackground))
                .cornerRadius(12)
                .shadow(radius: 40)
                .overlay(  Button {
                    isShowingDetail = false
                } label: {
                XDismissButton()
                }, alignment: .topTrailing)
            
   
        }
      
    }


struct OrderDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailsView(appetizer: MOCKDATA.sampleAppetizer, isShowingDetail: .constant(true))
            .environmentObject(Order())
    }
}


struct NutritionInfo: View {
    let title: String
    let value: Int
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

