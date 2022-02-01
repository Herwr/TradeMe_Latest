//
//  ListingRowView.swift
//  TradeMe_Latest
//
//  Created by Rich on 2/1/22.
//  Copyright © 2022 Funky Gadget Limited. All rights reserved.
//

import SwiftUI

struct ListingRowView: View {
    @State var listing: Listing
    @State var showTapAlert = false

    var body: some View {
        HStack {
            if let photoHRef = listing.pictureHref {
                AsyncImage(url: URL(string: photoHRef))
                    .frame(width: 100, height: 100)
            }
            else {
                Rectangle()
                    .opacity(0.25)
                    .frame(width: 100, height: 100)
                    .overlay {
                        VStack {
                            Text("No Photo")
                                .foregroundColor(.white)
                        }
                    }
            }

            VStack(alignment: .leading) {
                Text(listing.region ?? "Unspecified")
                    .font(.listingRowSmall)
                    .foregroundColor(.gray)
                
                Text(listing.title)
                    .font(.listingRowStandard)
                    .bold()
                               
                Spacer()
             
                PurchasingView(listing: listing)
            }
        }
        .onTapGesture { showTapAlert = true }
        .alert(isPresented: $showTapAlert) {
            Alert(title: Text("Tapped on..."),
                  message: Text(listing.title),
                  dismissButton: .cancel(Text("Ok"),
                                         action: { showTapAlert = false }))
        }

    }
}

struct PurchasingView : View {
    @State var listing: Listing
    
    var body: some View {
        HStack {
            if let startPrice = listing.startPrice, !(listing.isBuyNowOnly ?? false) {
                VStack(alignment: .leading) {
                    Text("$\(String(format: "%.02f", startPrice))")
                        .font(.listingRowStandard)
                        .bold()

                    
                    let costLabel = (listing.isClassified ?? false) ? "Asking Price" : "Start price"
                        Text(costLabel)
                            .font(.listingRowSmall)
                            .foregroundColor(.gray)
                }
            }
            
            Spacer()
            
            if let buyNowPrice = listing.buyNowPrice {
                VStack(alignment: .trailing) {
                    Text("$\(String(format: "%.02f", buyNowPrice))")
                        .font(.listingRowStandard)
                        .bold()
                    Text("Buy Now")
                        .font(.listingRowSmall)
                        .foregroundColor(.gray)
                        .bold()
                }
            }
        }
    }
}

struct ListingRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListingRowView(listing: Listing.testData[0])
    }
}
