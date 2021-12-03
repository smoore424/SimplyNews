//
//  SNDataViewController.swift
//  SimplyNews
//
//  Created by Stacey Moore on 11/30/21.
//

import UIKit

class SNDataViewController: UIViewController {

    //TODO: LoadingView
    
    func showEmptyStateView(with message: String, in view: UIView) {
        let emptyStateView = SNEmptyStateView(message: message)
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
    }

}
