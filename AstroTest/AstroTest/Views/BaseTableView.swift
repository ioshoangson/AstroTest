//
//  BaseTableView.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class BaseTableView: BaseView {
    private(set) var nibName: String?
    private(set) var cellIdentifier: String?
    private(set) var tableView: UITableView?
    
    var didSelectItemAtIndex: (AnyObject, IndexPath)->Void = {
        (item: AnyObject, atIndex: IndexPath) -> Void in
    }
    
    public weak var context: BaseViewController?
    
    public func registerNibCell(nibName: String, cellIdentifier: String, tableView: UITableView) {
        self.nibName = nibName
        self.cellIdentifier = cellIdentifier
        self.tableView = tableView
        self.tableView?.register(UINib(nibName: self.nibName!, bundle: nil), forCellReuseIdentifier: self.cellIdentifier!)
    }
    
    
    private(set) var dataSource: [AnyObject] = []
    private(set) var configTableViewLayout: ConfigTableViewLayout?
    
    public var configTableView: ConfigTableView? = nil {
        didSet {
            self.dataSource = (self.configTableView?.dataSource)!
            self.configTableViewLayout = self.configTableView?.configTableViewLayout
        }
    }
    
    public func setDataSource(dataSource: AnyObject) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupTableView()
    }
    
    public func setupTableView() {
        
    }
    
    public func reloadTableView() {
        self.tableView?.reloadData()
    }
}


extension BaseTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier!) as! BaseTableViewCell
        cell.updateData(data: self.dataSource[indexPath.row] as AnyObject)
        cell.delegate = self.context != nil ? self.context as? TableViewCellDelegate: nil
        cell.configCellAtIndex(index: indexPath)
        return cell
    }
}

extension BaseTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.configTableView != nil ? (self.configTableViewLayout?.heightCell)! : 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.didSelectItemAtIndex(self.dataSource[indexPath.row] as AnyObject, indexPath)
    }
}
