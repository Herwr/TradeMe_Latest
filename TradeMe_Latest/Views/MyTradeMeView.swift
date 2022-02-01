//
//  MyTradeMeView.swift
//  TradeMe_Latest
//
//  Created by Rich on 2/1/22.
//  Copyright © 2022 Funky Gadget Limited. All rights reserved.
//

import SwiftUI

struct MyTradeMeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("My TradeMe")
                    .font(.largeTitle)
                    .bold()

                Text("This Tab is under construction!")
                    .font(.headline)
                    .foregroundColor(.red)
            }
            .navigationTitle("My TradeMe")
            .navigationBarItems(trailing: NavigationButtonsView())
        }
    }
}

struct MyTradeMeView_Previews: PreviewProvider {
    static var previews: some View {
        MyTradeMeView()
    }
}
