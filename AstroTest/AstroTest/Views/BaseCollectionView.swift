//
//  BaseCollectionView.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class BaseCollectionView: BaseView {
    private(set) var nibName: String?
    private(set) var cellIdentififer: String?
    private(set) var collectionView: UICollectionView?
    
    public weak var context: BaseViewController?
    
    public func registerNibCell(nibName: String, cellIdentifier: String, collectionView: UICollectionView) {
        self.nibName = nibName
        self.cellIdentififer = cellIdentifier
        self.collectionView = collectionView
        self.collectionView?.register(UINib(nibName: self.nibName!, bundle: nil), forCellWithReuseIdentifier: self.cellIdentififer!)
    }
    
    
    private(set) var dataSource: [AnyObject] = []
    private(set) var collectionViewFlowLayout: ConfigCollectionViewFlowLayout?
    
    public var configCollectionView: ConfigCollectionView? = nil {
        didSet {
            self.dataSource = (self.configCollectionView?.dataSource)!
            self.collectionViewFlowLayout = self.configCollectionView?.collectionViewFlowLayout
        }
    }
    
    public func setDataSource(dataSource: AnyObject) {
        
    }
    
    public func sizeForItems() -> CGSize {
        return CGSize.zero
    }
    
    public func configCollectionViewLayoutForDevice() -> ConfigCollectionViewFlowLayout? {
        return nil
    }
    
    
    //Call back when selected item
    var didSelectItemAtIndex: (AnyObject, IndexPath)->Void = {
        (item: AnyObject, atIndex: IndexPath) -> Void in
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupCollectionView()
    }
    
    public func setupCollectionView() {
        
    }
    
    public func reloadCollectionView() {
        self.collectionView?.reloadData()
    }
    
    public func reloadCollectionViewAtIndex(index: IndexPath) {
        self.collectionView?.reloadItems(at: [index])
    }
    
    public func reloadCollectionViewAtSection(index: IndexSet) {
        self.collectionView?.reloadSections(index)
    }
}

extension BaseCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.configCollectionView != nil ? self.collectionViewFlowLayout!.itemSize : CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return self.configCollectionView != nil ? (self.collectionViewFlowLayout?.insetForSection)! : UIEdgeInsets.zero
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return self.configCollectionView != nil ? (self.collectionViewFlowLayout?.minimumLineSpacingForSection)! : 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return self.configCollectionView != nil ? (self.collectionViewFlowLayout?.minimumInteritemSpacingForSection)! : 0
    }
}


extension BaseCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentififer!, for: indexPath as IndexPath) as! BaseCollectionViewCell
        cell.updateData(data: self.dataSource[indexPath.row] as AnyObject)
        cell.delegate = self.context != nil ? context as? CollectionViewCellDelegate : nil
        cell.configCellAtIndex(index: indexPath)
        return cell
    }
}

extension BaseCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.didSelectItemAtIndex(self.dataSource[indexPath.row] as AnyObject, indexPath)
    }
}
