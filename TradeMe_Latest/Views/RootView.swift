//
//  RootView.swift
//  TradeMe_Latest
//
//  Created by Rich on 2/1/22.
//  Copyright © 2022 Funky Gadget Limited. All rights reserved.
//

import SwiftUI

struct RootView: View {
    private enum Tab: Hashable {
        case listings
        case watchlist
        case myTradeMe
    }
    
    @State private var selectedTab: Tab = .listings
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ListingsView()
                .tag(Tab.listings)
                .tabItem {
                    VStack {
                        Text("Latest Listings")
                        Image(systemName: "magnifyingglass")
                    }
                }

            WatchlistView()
                .tag(Tab.watchlist)
                .tabItem {
                    VStack {
                        Text("Watchlist")
                        Image(systemName: "binoculars")
                    }
                }

            MyTradeMeView()
                .tag(Tab.myTradeMe)
                .tabItem {
                    VStack {
                        Text("My TradeMe")
                        Image(systemName: "person.crop.circle")
                    }
                }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
