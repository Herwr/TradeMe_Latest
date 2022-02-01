//
//  NavigationButtonsView.swift
//  TradeMe_Latest
//
//  Created by Rich on 2/1/22.
//  Copyright © 2022 Funky Gadget Limited. All rights reserved.
//

import SwiftUI

struct NavigationButtonsView: View {
    @State private var showAlert = false
    @State private var alertTitle = ""
    private var alertMessage = "Not Available"

    var body: some View {
        HStack {
            Button(action: { searchAction() }) {
                    Image("search").imageScale(.large)
            }
            Button(action: { cartAction() }) {
                    Image("cart").imageScale(.large)
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertTitle),
                  message: Text(alertMessage),
                  dismissButton: .cancel(Text("Ok"),
                                         action: { showAlert = false }))
        }
    }
}

extension NavigationButtonsView {
    func searchAction() {
        alertTitle = "Search"
        showAlert = true
    }
    
    func cartAction() {
        alertTitle = "Cart"
        showAlert = true
    }
}

struct NavigationButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationButtonsView()
    }
}
