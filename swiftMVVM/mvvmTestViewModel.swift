import Foundation
import RxSwift
import RxCocoa
import UIKit

class mvvmTestViewModel {
    
    let labelDriver: Driver<String>
    let changeIndex = PublishSubject<Void>()
    let disposeBag = DisposeBag()
    
    init(model: mvvmTestModel) {
        
        let variable = Variable(model)
        let modelDriver = variable.asDriver()
        
        labelDriver = modelDriver.map{
            $0.cache[$0.presentIndex]
        }.distinctUntilChanged()
        .asDriver()
        
        changeIndex.subscribe(onNext: { _ in
            if model.presentIndex > model.cache.count - 2 {
                model.presentIndex = 0
            } else {
                model.presentIndex += 1
            }
            variable.value = model
            print("DEBUG: update model")
        }).addDisposableTo(disposeBag)
        
    }
    
}

