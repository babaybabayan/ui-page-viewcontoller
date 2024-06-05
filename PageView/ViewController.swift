//
//  ViewController.swift
//  PageView
//
//  Created by Binar - Mei on 05/06/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tabContainerView: UIView!
    @IBOutlet weak var tabViewIndicator: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        tabContainerView.clipsToBounds = true
        tabViewIndicator.clipsToBounds = true
    }


}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.bounds.width
        let scrollOffsetX = scrollView.contentOffset.x
        let roundVAlue = round((scrollOffsetX / pageWidth) * 10) / 10.0
        let maxScroll = tabContainerView.frame.size.width - tabViewIndicator.frame.size.width
        UIView.animate(withDuration: .zero) { [weak self] in
            self?.tabViewIndicator.frame.origin.x = roundVAlue * maxScroll
        }
    }
}
