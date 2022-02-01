//
//  ApiManager.swift
//  TradeMe_Categories
//
//  Created by Rich on 1/27/22.
//

import Foundation
import Combine

struct ApiManager {
    // Singleton
    static let shared = ApiManager()
    private init() {}
        
    public enum APIError: LocalizedError {
        case unreachable(URL)
        case responseInvalid
        case authorisationError(String)
        
        var errorDescription: String? {
            switch self {
            case .responseInvalid: return "The server response was invalid."
            case .unreachable(let url): return "The URL: '\(url.absoluteString)' is unreachable."
            case .authorisationError(let error): return "Failed Authorisation with service error: \(error)"
            }
        }
    }
    
    // MARK: - Private
    private let maxListings = 20
    private let jsonDecoder = JSONDecoder()
    private let apiQueue = DispatchQueue(label: "API",
                                         qos:.default,
                                         attributes: .concurrent)
}

extension ApiManager : ApiInterface {
    // Fetch 'latest' listings
    func fetchLatestListings() -> AnyPublisher<LatestListings, Error> {
        guard
            let endpointUrl = EndPoint.latestListings(maxListings).url
        else {
            // TODO: Generate Error to return via publisher
            print("Error: Counldn't create Endpoint URL")
            return Empty<LatestListings, Error>().eraseToAnyPublisher()
        }
        
        let request = OAuthHelper.urlRequestWithOAuthHeader(for: endpointUrl,
                                                            credentials: .interview,
                                                            headerType: .appAuthenticatedCall)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: apiQueue)
            .map(\.data)
            .decode(type: LatestListings.self, decoder: jsonDecoder)
            .mapError { error -> APIError in
                switch error {
                case is URLError:
                    return APIError.unreachable(endpointUrl)
                default:
                    return APIError.responseInvalid
                }
            }
            .catch { _ in Empty() }
            .eraseToAnyPublisher()
    }
}
