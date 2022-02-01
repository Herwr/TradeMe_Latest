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
                    .foregroundColor(.bluffOyster600)
                
                Text(listing.title)
                    .font(.listingRowStandard)
                    .bold()
                    .foregroundColor(.bluffOyster800)

                Spacer()
             
                PurchaseView(listing: listing)
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

struct PurchaseView : View {
    @State var listing: Listing
    
    var body: some View {
        HStack {
            if let startPrice = listing.startPrice, !(listing.isBuyNowOnly ?? false) {
                VStack(alignment: .leading) {
                    Text("$\(String(format: "%.02f", startPrice))")
                        .font(.listingRowStandard)
                        .bold()
                        .foregroundColor(.bluffOyster800)
                    
                    let costLabel = (listing.isClassified ?? false) ? "Asking Price" : "Start price"
                        Text(costLabel)
                            .font(.listingRowSmall)
                            .foregroundColor(.bluffOyster600)
                }
            }
            
            Spacer()
            
            if let buyNowPrice = listing.buyNowPrice {
                VStack(alignment: .trailing) {
                    Text("$\(String(format: "%.02f", buyNowPrice))")
                        .font(.listingRowStandard)
                        .bold()
                        .foregroundColor(.bluffOyster800)

                    Text("Buy Now")
                        .font(.listingRowSmall)
                        .foregroundColor(.gray)
                        .bold()
                        .foregroundColor(.bluffOyster600)
                }
            }
        }
    }
}

struct ListingRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListingRowView(listing: Listing.testData[0])
            .frame(width: 100, height:100, alignment: .leading)
    }
}
