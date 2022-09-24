//
//  CALayerView.swift
//  WikiApp
//
//  Created by tiking on 2021/10/30.
//

import SwiftUI

//UIViewRepresentableにするとframe(width: 0 ,height:0)になり表示されなくなる
struct CALayerView: UIViewControllerRepresentable {
    var caLayer: CALayer

    func makeUIViewController(context: UIViewControllerRepresentableContext<CALayerView>) -> UIViewController {
        let viewController = UIViewController()

        viewController.view.layer.addSublayer(caLayer)
        caLayer.frame = viewController.view.layer.frame

        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<CALayerView>) {
        caLayer.frame = uiViewController.view.layer.frame
    }
}
