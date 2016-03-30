//
//  HomeViewController.swift
//  FuzzySearchChallenge
//
//  Created by Parker Donat on 3/30/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

/*
 
 Challenge: Fuzzy Search
 
 Build a Fuzzy Search against the Webster's Dictionary. Fuzzy Search allows you to search for terms with similar characters, not necessarily in the same order. A fuzzy matching program can compensate for common input input typing errors. As an example, press Command + Shift + O in an Xcode project and start typing. Notice how the results are not necessary exactly what you've typed into the search box. This is an example of Fuzzy Search.
 
 Steps: 1. Create a new single view application 2. Add the Word List JSON dictionary found on Github to the project (https://github.com/adambom/dictionary/blob/master/dictionary.json) 3. List all words in the table view 4. Use a Search Controller to allow searching the words 5. When filtering your results for the search term, write an algorithm that will enable fuzzy search results.
 
 When you are finished, compare your fuzzy search algorithm with 2 other students in class. Discuss the pros and cons of each approach. Identify at least 3 areas to improve your algorithm.
 
 Hints: * Timeline as Search Controller example * Swift String .characters property
 
 Black Diamond
 
 Sort your search results by best match in your algorithm
 Add a detail view controller that displays the definition of the word
 Use Table View sections to separate words beginning with each letter of the alphabet
 Add an Index List on the right hand side (similar to the alphabetical control in Contacts) for quick navigation
 
 https://github.com/adambom/dictionary/blob/master/dictionary.json
 
 */

import UIKit

class HomeViewController: UITableViewController, UISearchResultsUpdating {

    var searchController: UISearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        WordController.createWordList()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WordController.words.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("wordCell", forIndexPath: indexPath)
        let word = WordController.words[indexPath.row]
        cell.textLabel?.text = word.word
        
        return cell
    }
    
    func setupSearchController() {
        let resultsController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("resultsController")
        searchController = UISearchController(searchResultsController: resultsController)
        guard let searchController = searchController else {return}
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.placeholder = "Search for a word..."
        tableView.tableHeaderView = searchController.searchBar
        //        searchController.searchBar.sizeToFit()
        definesPresentationContext = true
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        guard let searchTerm = searchController.searchBar.text?.lowercaseString else {return}
        let resultsController = searchController.searchResultsController as? SearchResultsTableViewController
        resultsController?.dataSource = WordController.words.filter({$0.word.lowercaseString.containsString(searchTerm)})
        resultsController?.tableView.reloadData()
    }
}
