//
//  ChannelsListViewController.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class ChannelsListContentView: BaseTableView {
    let HEIGHT_CELL: CGFloat = 76
    
    @IBOutlet private(set) var contentTableView: UITableView?
    private var contentConfigTableViewLayout: ConfigTableViewLayout?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setupTableView() {
        self.registerNibCell(nibName: String(describing: ChannelTableViewCell.self), cellIdentifier: String(describing: ChannelTableViewCell.self), tableView: self.contentTableView!)
        self.contentConfigTableViewLayout = ConfigTableViewLayout(heightCell: HEIGHT_CELL, tableViewStyle: .plain)
    }
    
    override func setDataSource(dataSource: AnyObject) {
        self.configTableView = ConfigTableView(dataSources: dataSource as! [AnyObject], configTableViewLayout: self.contentConfigTableViewLayout!)
        self.reloadTableView()
    }
}

class ChannelsListViewController: BaseViewController {
    
    @IBOutlet weak private(set) var channelsListContentView: ChannelsListContentView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
