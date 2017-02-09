//
//  ViewController.swift
//  Cheat
//
//  Created by Anh Tuan on 2/9/17.
//  Copyright © 2017 Anh Tuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tbl : UITableView!
    @IBOutlet weak var txt : UITextField!
    var dataText = [String]()
    var res = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = Bundle.main.path(forResource: "HCI", ofType: "txt")
        do {
            let data = try String(contentsOfFile: url!, encoding: String.Encoding.isoLatin1)
            NSLog("\(data)")
            dataText = data.components(separatedBy: "\n")
        } catch (let ex){
            NSLog("\(ex.localizedDescription)")
        }
        tbl.rowHeight = UITableViewAutomaticDimension
        tbl.estimatedRowHeight = 100
        self.view.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(ViewController.dismisKeyboard(_:))))
        self.tbl.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(ViewController.dismisKeyboard(_:))))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func dismisKeyboard(_ gesture : UITapGestureRecognizer) {
        txt.resignFirstResponder()
    }

    
    @IBAction func txtChange(_ sender: Any) {
        search(txt: txt.text ?? "")
    }
    @IBAction func clearTouchUp(_ sender : UIButton) {
        txt.text = ""
    }
    
    func search(txt : String) {
        var tmp = [String]()
        for item in dataText {
            if item.contains(txt) {
                tmp.append(item)
            }
        }
        res = tmp
        DispatchQueue.main.async {
            self.tbl.reloadData()
        }
    }
}
extension ViewController : UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return res.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbl.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.lbl.text = res[indexPath.row]
        return cell
    }
}
