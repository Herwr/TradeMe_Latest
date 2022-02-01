//
//  ListingsViewModel.swift
//  TradeMe_Latest
//
//  Created by Rich on 2/1/22.
//  Copyright © 2022 Funky Gadget Limited. All rights reserved.
//

import Foundation
import Combine

final class ListingsViewModel : BaseViewModel {
    @Published var listings = [Listing]()
    
    private var latestListings: LatestListings?
    
    override init(apiManager: ApiInterface? = nil) {
        super.init(apiManager: apiManager)
        fetchLatest()
    }

    func fetchLatest() {
        apiManager
            .fetchLatestListings()
            .receive(on: DispatchQueue.main)
            .catch { _ in Empty<LatestListings, Error>() }
            .sink(receiveCompletion: {  [weak self] completion in
                switch completion {
                case .failure(let apiError as ApiManager.APIError):
                    //print("APIERROR: \(apiError)")
                    self?.errorMessage = apiError.errorDescription
                case .failure(let error):
                    //print("ERROR: \(error)")
                    self?.errorMessage = "An unhandled Error occurred: \(error.localizedDescription)"
                case .finished:
                    self?.errorMessage = nil
                }
            }, receiveValue: {  [weak self] value in
                self?.listings = value.list
            })
            .store(in: &subscriptions)
    }
}
