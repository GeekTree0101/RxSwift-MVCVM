import UIKit
import RxSwift
import RxCocoa
import Foundation

class Country {
    
    var countryName: String?
    var countryPicture: UIImage?
    var countryDescription: String?
    
    init(name: String, img: UIImage, description: String) {
        self.countryName = name
        self.countryDescription = description
        self.countryPicture = remakeImageForInterestCountryImageView(img.cgImage)
    }
    
    func remakeImageForInterestCountryImageView( _ img: CGImage?) -> UIImage? {
        guard let img = img else { return nil }
        let isWidthMoreLarge = img.width > img.height ? true : false
        if isWidthMoreLarge {
            let cropOffsetX: CGFloat = CGFloat((img.width - img.height) / 2 )
            let clipPath: CGRect = CGRect(x: cropOffsetX, y: 0, width: CGFloat(img.height), height: CGFloat(img.height))
            return UIImage(cgImage: img.cropping(to: clipPath)!)
        } else {
            let cropOffsetY: CGFloat = CGFloat((img.height - img.width) / 2 )
            let clipPath: CGRect = CGRect(x: 0, y: cropOffsetY, width: CGFloat(img.width), height: CGFloat(img.width))
            return UIImage(cgImage: img.cropping(to: clipPath)!)
        }
    }
}

extension Country: ReactiveCompatible {} 
