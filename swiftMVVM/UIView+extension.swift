import UIKit

extension UIView {
    class func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: String(describing: self), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first
        return nibView as! UIView
    }
}
