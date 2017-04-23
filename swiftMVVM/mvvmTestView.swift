import UIKit
import RxSwift
import RxCocoa

class mvvmTestView: UIView {

    @IBOutlet var changeModelButton: UIButton!
    @IBOutlet var showLabel: UILabel!
    
    let disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension mvvmTestView {
    
    func binding(viewModel: mvvmTestViewModel){
        viewModel.labelDriver.drive(self.showLabel.rx.text).addDisposableTo(disposeBag)
        
        changeModelButton.rx.tap.subscribe(onNext: {
            viewModel.changeIndex.onNext()
        }).addDisposableTo(disposeBag)
        
    }
}
