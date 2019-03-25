//
//  ViewController.swift
//  EasyMultithreading
//
//  Created by mac on 3/19/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class ThreadViewController: UIViewController {
    
    //MARK: Create Outlets
    var tableView: UITableView!
    
    //MARK: Properties
    let CELL_IDENTIFIER = "CellID"
    
    //MARK: Test Arrays
    let intArray = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    let intArray2 = [21, 22, 23, 24, 25, 26, 27, 28, 29]
    let charArray = ["a", "b", "c", "d", "e", "f", "g", "h", "i"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //init table view with the frame of the view
        tableView = UITableView(frame: self.view.frame)
        
        //add table view to view as sub view
        self.view.addSubview(tableView)
        
        
        editTableView()
    }
    
    func editTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.backgroundColor = .white
    }
    


}
//MARK: Table View Data Source

extension ThreadViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //create reference to dequeuecell
        var dequeueCell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER)
        
        //check if cell is nil, if so instantiate cell
        if dequeueCell == nil {
            
            dequeueCell = UITableViewCell(style: .subtitle, reuseIdentifier: CELL_IDENTIFIER)
        }
        
        //set cell = to dequeueCell
        let cell = dequeueCell!
        
        //set cell text label and subtitle number of lines (0 = enclose text)
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.numberOfLines = 0
        

        //create switch to check indexPath.row
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Dispatch.main.sync"
            cell.detailTextLabel?.text = "Performs tasks sequentially on main thread"
        case 1:
            cell.textLabel?.text = "Dispatch.global.async"
            cell.detailTextLabel?.text = "Performs tasks concurrently on global thread"
        case 2:
            cell.textLabel?.text = "Operation Blocks"
            cell.detailTextLabel?.text = "Execute several blocks concurrently"
        case 3:
            cell.textLabel?.text = "Dispatch Groups"
            cell.detailTextLabel?.text = "Perform groups of task synchronously and be notified upon completion"
        case 4:
            cell.textLabel?.text = "Dispatch Barrier"
            cell.detailTextLabel?.text = "Create a synchronization point within a concurrent queue "
        case 5:
            cell.textLabel?.text = "Dispatch Semaphore"
            cell.detailTextLabel?.text = "Can be used to control access to a resource across multiple execution threads"
        default:
            break
        }
        
        
        
        return cell
    }
    
} // end extension

//MARK: Table View Delegate

extension ThreadViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            doSyncTasks()
        case 1:
            doAsyncTasks()
        case 2:
            doBlockOperations()
        case 3:
            doDispatchGroups()
        case 4:
            doDispatchBarrier()
        case 5:
            doDispatchSemaphore()
        default:
            break
        }
    }
} // end extension

