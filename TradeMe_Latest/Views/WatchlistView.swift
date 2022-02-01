//
//  WatchlistView.swift
//  TradeMe_Latest
//
//  Created by Rich on 2/1/22.
//  Copyright © 2022 Funky Gadget Limited. All rights reserved.
//

import SwiftUI

struct WatchlistView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Watchlist")
                    .font(.largeTitle)
                .bold()

                Text("This Tab is under construction!")
                    .font(.headline)
                    .foregroundColor(.red)
            }
            .navigationTitle("Watchlist")
            .navigationBarItems(trailing: NavigationButtonsView())
        }
    }
}

struct WatchlistView_Previews: PreviewProvider {
    static var previews: some View {
        WatchlistView()
    }
}
