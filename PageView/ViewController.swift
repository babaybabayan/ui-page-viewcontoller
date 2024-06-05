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
    @IBOutlet weak var tabButton1: UIButton!
    @IBOutlet weak var tabButton2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        tabContainerView.clipsToBounds = true
        tabViewIndicator.clipsToBounds = true
    }
    
    private func scrollTo(next: Bool) {
        let currentOffset = scrollView.contentOffset
        let pageWidth = scrollView.bounds.width
        let newOffset = CGPoint(x: currentOffset.x + (next ? pageWidth : -pageWidth), y: currentOffset.y)
        let maxOffsetX = scrollView.contentSize.width - scrollView.bounds.width
        if newOffset.x >= 0 && newOffset.x <= maxOffsetX {
            scrollView.setContentOffset(newOffset, animated: true)
        }
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        if sender == tabButton1 {
            scrollTo(next: false)
        } else {
            scrollTo(next: true)
        }
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.bounds.width
        let scrollOffsetX = scrollView.contentOffset.x
        let normalizedOffset = scrollOffsetX / pageWidth
        let maxScroll = tabContainerView.frame.width - tabViewIndicator.frame.width
        let indicatorPosition = normalizedOffset * maxScroll
        UIView.animate(withDuration: .zero) { [weak self] in
            self?.tabViewIndicator.frame.origin.x = indicatorPosition
        }
    }
}
