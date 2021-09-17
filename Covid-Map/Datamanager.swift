//
//  Datamanager.swift
//  Covid-Map
//
//  Created by Stefano Brandi on 19/07/21.
//

import UIKit
import Alamofire

class Datamanager {
    
    static let shared = Datamanager()
    
    let headers: HTTPHeaders = ["x-rapidapi-key": "23610c28d8msh60990f2713e479fp13d09cjsn29d24b8c9107",
                                "x-rapidapi-host": "covid-19-coronavirus-statistics.p.rapidapi.com"]
    
    
    var getCovid : Main = Main()
    
    var flagSearch = false
    
    // alert connessione e caricamento
    func alertLoading(message: String) -> UIAlertController{
        let loading = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating()
        
        loading.view.addSubview(loadingIndicator)
        
        return loading
    }
    
    
    func callCountry(view: UIViewController?, countryName: String, completion: @escaping (Bool) -> ()) {
        
        let loading = alertLoading(message: "Loading, please wait")
        
        AF.request("https://covid-19-coronavirus-statistics.p.rapidapi.com/v1/total?country=\(countryName)", method: .get, headers: headers)
            .responseJSON { (response) in
                
                if self.flagSearch == false {
                    view?.present(loading, animated: true, completion: nil)
                }
                
                if response.data != nil{
                    
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try? jsonDecoder.decode(Main.self, from: response.data!)
                    
                    self.getCovid = responseModel!
                    
                    if self.flagSearch == false {
                        loading.dismiss(animated: true, completion: nil)
                    }
                    completion(true)
                    
                } else {
                    print("Errore")
                    loading.dismiss(animated: true, completion: nil)
                    completion(true)
                }
                
            }
        
    }
    
}
