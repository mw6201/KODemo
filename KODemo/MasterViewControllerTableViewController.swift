//
//  MasterViewControllerTableViewController.swift
//  KODemo
//
//  Created by Michael Walter on 12.06.15.
//  Copyright (c) 2015 Michael Walter. All rights reserved.
//

import UIKit

protocol MonsterSelectionDelegate: class {
    func monsterSelected(newMonster: Monster)
}

class MasterViewControllerTableViewController: UITableViewController {

    weak var delegate: MonsterSelectionDelegate?
    
    var monsters = [Monster]()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.monsters.append(Monster(name: "Cat-Bot", description: "MEE-OW",
            iconName: "meetcatbot.png", weapon: Weapon.Sword))
        self.monsters.append(Monster(name: "Dog-Bot", description: "BOW-WOW",
            iconName: "meetdogbot.png", weapon: Weapon.Blowgun))
        self.monsters.append(Monster(name: "Explode-Bot", description: "BOOM!",
            iconName: "meetexplodebot.png", weapon: Weapon.Smoke))
        self.monsters.append(Monster(name: "Fire-Bot", description: "Will Make You Stamed",
            iconName: "meetfirebot.png", weapon: Weapon.NinjaStar))
        self.monsters.append(Monster(name: "Ice-Bot", description: "Has A Chilling Effect",
            iconName: "meeticebot.png", weapon: Weapon.Fire))
        self.monsters.append(Monster(name: "Mini-Tomato-Bot", description: "Extremely Handsome",
            iconName: "meetminitomatobot.png", weapon: Weapon.NinjaStar))
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.monsters.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell

        let monster = self.monsters[indexPath.row]
        cell.textLabel?.text = monster.name

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var _kc = (UIApplication.sharedApplication().delegate! as! AppDelegate)._KOClient
        
        if _kc.User_Token != "" {
            _kc.GetTransportStatusList()
        }
        
        //let selectedMonster = self.monsters[indexPath.row]
        //self.delegate?.monsterSelected(selectedMonster)
        
        if let detailViewController = self.delegate as? DetailsViewController {
            //detailViewController.dismissViewControllerAnimated(true, completion: nil)
            splitViewController?.showDetailViewController(detailViewController, sender: nil)
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
