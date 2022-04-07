//
//  ViewController.swift
//  Multiple Group TableView
//
//  Created by Meghna on 07/04/22.
//

import UIKit

class ViewController: UITableViewController {
    
    //
    // MARK: - Data
    //
    
    struct Section {
        var name: String!
        var items: [String]!
        var collapsed: Bool!
        
        init(name: String, items: [String], collapsed: Bool = false) {
            self.name = name
            self.items = items
            self.collapsed = collapsed
        }
    }
    
    var sections = [Section]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sections = [
            Section(name: "Category 1", items: ["Subcategory"]),
            Section(name: "Category 2", items: ["Subcategory"]),
            Section(name: "category 3", items: ["Subcategory"])
        ]
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case 0:  return ""
            case 1:  return ""
            default: return ""
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        
        // For section 1, the total count is items count plus the number of headers
        var count = sections.count
        
        for section in sections {
            count += section.items.count
        }
        
        return count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return tableView.rowHeight
        }
        
        let section = getSectionIndex(indexPath.row)
        let row = getRowIndex(indexPath.row)
        
        if row == 0 {
            return 50.0
        }
        
        return sections[section].collapsed! ? 0 : 44.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "title") as UITableViewCell?
            cell?.textLabel?.text = "Product List"
            return cell!
        }
        
        // Calculate the real section index and row index
        let section = getSectionIndex(indexPath.row)
        let row = getRowIndex(indexPath.row)
        
        if row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "header") as! HeaderCell
            cell.titleLabel.text = sections[section].name
            cell.toggleButton.tag = section
            cell.toggleButton.setTitle(sections[section].collapsed! ? "+" : "-", for: UIControl.State())
            cell.toggleButton.addTarget(self, action: #selector(ViewController.toggleCollapse), for: .touchUpInside)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell?
            cell?.textLabel?.text = sections[section].items[row - 1]
            return cell!
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0){
            print("1 table\(indexPath.row)")
        }else if (indexPath.row == 1){
            print("inner table\(indexPath.row)")
        }
    }
    
    @objc  func toggleCollapse(_ sender: UIButton) {
        let section = sender.tag
        let collapsed = sections[section].collapsed
        
        sections[section].collapsed = !collapsed!
        
        let indices = getHeaderIndices()
        
        let start = indices[section]
        let end = start + sections[section].items.count
        
        tableView.beginUpdates()
        for i in start ..< end + 1 {
            tableView.reloadRows(at: [IndexPath(row: i, section: 1)], with: .automatic)
        }
        tableView.endUpdates()
    }
    
    
    func getSectionIndex(_ row: NSInteger) -> Int {
        let indices = getHeaderIndices()
        
        for i in 0..<indices.count {
            if i == indices.count - 1 || row < indices[i + 1] {
                return i
            }
        }
        
        return -1
    }
    
    func getRowIndex(_ row: NSInteger) -> Int {
        var index = row
        let indices = getHeaderIndices()
        
        for i in 0..<indices.count {
            if i == indices.count - 1 || row < indices[i + 1] {
                index -= indices[i]
                break
            }
        }
        
        return index
    }
    
    func getHeaderIndices() -> [Int] {
        var index = 0
        var indices: [Int] = []
        
        for section in sections {
            indices.append(index)
            index += section.items.count + 1
        }
        
        return indices
    }

}
