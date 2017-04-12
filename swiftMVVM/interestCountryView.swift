import UIKit
import RxSwift
import RxCocoa

class interestCountryView: UITableViewCell {

    let disposeBag = DisposeBag()
    
    @IBOutlet var picture: UIImageView!
    @IBOutlet var countryName: UILabel!
    @IBOutlet var countryDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}


extension interestCountryView {
    
    func configure(_ viewModel: interestCountryViewModel) {
        // TODO : bind view model on interestCountryView
        
        viewModel.countryName.drive(countryName.rx.text).addDisposableTo(disposeBag)
        viewModel.countryDescription.drive(countryDescription.rx.text).addDisposableTo(disposeBag)
        viewModel.countryImage.filterNil().drive(picture.rx.image).addDisposableTo(disposeBag)
    }
}
