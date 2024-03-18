//
//  UIViewController.swift
//  Weekly Mile Tracker
//
//  Created by Moses Harding on 3/11/24.
//

import Foundation
import UIKit

extension UIViewController {
    
    func presentAlert(_ title: String, body: String) {
        let alert = UIAlertController(
            title: title,
            message: body,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    
    func presentActivityViewController(sourceView: UIView, activityItem: Data ) {

        let activityViewController = UIActivityViewController(activityItems: [activityItem], applicationActivities: [])

        activityViewController.popoverPresentationController?.sourceView = sourceView
        activityViewController.popoverPresentationController?.sourceRect = sourceView.bounds

        self.present(activityViewController, animated: true, completion: nil)
    }
}
