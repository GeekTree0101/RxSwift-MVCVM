import UIKit
import RxSwift
import RxCocoa
import SnapKit

class MvvmMainController: UIViewController {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewModel = mvvmTestViewModel(model: mvvmTestModel())
        let viewModel2 = mvvmTestViewModel(model: mvvmTestModel())
        
        let controlView = mvvmTestView.loadViewFromNib() as! mvvmTestView
        let controlView2 = mvvmTestView.loadViewFromNib() as! mvvmTestView
        
        controlView.binding(viewModel: viewModel)
        controlView2.binding(viewModel: viewModel2)
        
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(controlView)
        self.view.addSubview(controlView2)
        
        controlView.snp.remakeConstraints({ make in
            make.top.left.right.equalToSuperview()
        })
        
        controlView2.snp.remakeConstraints({ make in
            make.left.right.equalToSuperview()
            make.top.equalTo(controlView.snp.bottom)
        })
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
