//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didFetchCoin(_ coinManager: CoinManager, coin: CoinModel)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    let privateAPI = Private()
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    
    var delegate: CoinManagerDelegate?
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)/?apikey=\(privateAPI.coinAPIKey)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let coin = self.parseJSON(safeData) {
                        delegate?.didFetchCoin(self, coin: coin)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ coinData: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            let baseCoin = decodedData.asset_id_base
            let quoteCoin = decodedData.asset_id_quote
            let rate = decodedData.rate
            
            let coin = CoinModel(baseCoin: baseCoin, quoteCoin: quoteCoin, rate: rate)
            return coin
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
    
    
}
