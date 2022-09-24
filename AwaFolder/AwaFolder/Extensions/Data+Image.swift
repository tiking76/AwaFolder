import Foundation
import UIKit

public extension Data {
    func toImage() -> UIImage {
        guard let image = UIImage(data: self) else {
            print("データをイメージに変換できませんでした。")
            return UIImage()
        }
        return image
    }
}
