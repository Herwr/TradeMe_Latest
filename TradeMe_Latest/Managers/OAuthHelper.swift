//
//  OAuthHelper.swift
//  TradeMe_Categories
//
//  Created by Rich on 1/30/22.
//

import Foundation


enum OAuthHeaderType {
    case appAuthenticatedCall
    case memberAuthenticatedCall
}

struct OAuthHelper {
    
    static func urlRequestWithOAuthHeader(for url: URL,
                                   credentials: Credentials,
                                   headerType: OAuthHeaderType) -> URLRequest {
        
        var urlRequest = URLRequest(url: url)
        
        let oAuthHeader = buildHeader(for: headerType, credentials: credentials)
        
        urlRequest.setValue(oAuthHeader,
                            forHTTPHeaderField: "Authorization")
        urlRequest.setValue("application/x-www-form-urlencoded",
                            forHTTPHeaderField: "Content-Type")
        
        return urlRequest
    }

    
    static private func buildHeader(for headerType: OAuthHeaderType,
                            credentials: Credentials) -> String {
        
        let oAuthCredentials : [String:String] = credentials.oAuthValues()
        guard
            let consumerKey: String = oAuthCredentials[OAuthKeys.consumerKey],
            let consumerSecret: String = oAuthCredentials[OAuthKeys.consumerSecret],
            let oAuthToken: String = oAuthCredentials[OAuthKeys.oAuthToken],
            let oAuthTokenSecret: String = oAuthCredentials[OAuthKeys.oAuthTokenSecret]
        else { return "" }

        switch headerType {
        case .appAuthenticatedCall:
            return #"OAuth oauth_consumer_key="\#(consumerKey)","#
                    + #"oauth_signature_method="PLAINTEXT","#
                    + #"oauth_signature="\#(consumerSecret)&""#

        case .memberAuthenticatedCall:
            return #"OAuth oauth_consumer_key="\#(consumerKey)","#
                    + #"oauth_token="\#(oAuthToken)","#
                    + #"oauth_signature_method="PLAINTEXT","#
                    + #"oauth_signature="\#(consumerSecret)&\#(oAuthTokenSecret)""#
        }
    }
}
