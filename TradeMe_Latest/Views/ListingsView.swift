//
//  ListingsView.swift
//  TradeMe_Listings
//
//  Created by Rich on 1/30/22.
//

import SwiftUI

struct ListingsView: View {
    @ObservedObject var viewModel = ListingsViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.listings) { listing in
                    ListingRowView(listing: listing)
                }
                .navigationTitle("Latest Listings")
                .navigationBarItems(trailing: NavigationButtonsView())
            }
        }
    }
}

struct ListingsView_Previews: PreviewProvider {
    static var previews: some View {
        ListingsView()
    }
}
