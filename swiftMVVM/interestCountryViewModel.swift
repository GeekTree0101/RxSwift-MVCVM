import UIKit
import Foundation
import RxSwift
import RxCocoa

class interestCountryViewModel {
    
    let disposeBag = DisposeBag()
    
    let countryName: Driver<String>
    let countryImage: Driver<UIImage?>
    let countryDescription: Driver<String>
    
    init(_ country: Country) {
        let countryObserver = Variable(country).asObservable().shareReplay(1)
        
        countryName = countryObserver
            .map{
                guard let name =  $0.countryName else { return "" }
                return name
            }
            .distinctUntilChanged()
            .asDriver(onErrorJustReturn: "")
        
        countryImage = countryObserver
            .map{
                guard let img =  $0.countryPicture else { return nil }
                return img
            }
            .distinctUntilChanged()
            .asDriver(onErrorJustReturn: nil)
        
        countryDescription = countryObserver
            .map{
                guard let name =  $0.countryDescription else { return "" }
                return name
            }
            .distinctUntilChanged()
            .asDriver(onErrorJustReturn: "")
    }
}
