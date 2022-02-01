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
                        Image("search")
                    }
                }

            WatchlistView()
                .tag(Tab.watchlist)
                .tabItem {
                    VStack {
                        Text("Watchlist")
                        Image("watchlist")
                    }
                }

            MyTradeMeView()
                .tag(Tab.myTradeMe)
                .tabItem {
                    VStack {
                        Text("My TradeMe")
                        Image("profile-16")
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
