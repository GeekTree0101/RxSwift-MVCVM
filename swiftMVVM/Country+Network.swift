import UIKit
import Foundation
import RxSwift
import RxOptional
import SwiftyJSON
import Alamofire

extension Reactive where Base: Country {
    
    static func load(_ url: String, _ params:[String:AnyObject?]) -> Observable<[Country]?>{
        return Observable.create({ observer in
            let requestGetCountryModel = Alamofire.request(url, method: .get, parameters: params, encoding: JSONEncoding.default).responseJSON(completionHandler: { res in
                let responseData = JSON(data: res.data!)
                switch res.result {
                case .success:
                    var countrySquence: [Country] = []
                    for _ in responseData {
                        let country = Country(name: "hello", img: UIImage(), description: "description")
                        countrySquence.append(country)
                    }
                    observer.onNext(countrySquence)
                case .failure:
                    observer.onNext(nil)
                }
            })
            return Disposables.create(with: requestGetCountryModel.cancel)
        })
    }
}
