//
//  UITableViewExtension.swift
//  GitHubRepositoriesApp
//
//  Created by Passant Abdelatif on 07/11/2022.
//

import UIKit
extension UITableView {
    
    func hideBackgroundView() {
        self.backgroundView?.isHidden = true
    }
    
    func reloadData(isEmpty: Bool, noDataView: UIView) {
        
        self.reloadData {
            self.backgroundView = isEmpty ? noDataView : nil
            self.backgroundView?.isHidden = !isEmpty
        }
    }
    
    func reloadData( completion: (() -> Void)?) {
        
        UIView.animate(withDuration: 0.0, animations: {
            self.reloadData()
        }, completion: { _ in
            completion?()
        })
    }
 

        func reloadDataWithoutScroll() {
            let offset = contentOffset
            reloadData()
            layoutIfNeeded()
            setContentOffset(offset, animated: false)
        }
}

