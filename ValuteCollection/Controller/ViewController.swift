//
//  ViewController.swift
//  ValuteCollection
//
//  Created by Egor on 19.03.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Delegator {
    
    
    
    let parser = Parser()
    var valutesCollection: UICollectionView!
    var layout = UICollectionViewFlowLayout()
    var localValutesArray: [Valute] = []
    let customCells = ValutesCollectionViewCell()
    let nib = UINib(nibName: "ValutesCollectionViewCell", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Valutes"
        self.view.backgroundColor = .green
        
        print("ViewController start")
        
        self.layout.itemSize = CGSize(width: 202, height: 50)
        self.layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        self.layout.scrollDirection = .horizontal
        self.valutesCollection = UICollectionView(frame: CGRect(x: 0, y: 50, width: self.view.frame.width, height: 100), collectionViewLayout: self.layout)
        
        self.valutesCollection.delegate = self
        self.valutesCollection.dataSource = self
        self.valutesCollection.backgroundColor = .red
        
        self.view.addSubview(self.valutesCollection)
        
        print("add valutesCollection")
        
        self.valutesCollection.register(nib, forCellWithReuseIdentifier: "ValuteCell")
        
        self.parser.doRequest {
            self.localValutesArray = self.parser.arrayOfMoney
            print(self.localValutesArray)
            self.valutesCollection.reloadData()
        }
        
    }
    
    func doSomething(data: (Int, String)) {
        self.localValutesArray[data.0].rate = data.1
        self.valutesCollection.reloadData()
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.localValutesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ValuteCell", for: indexPath) as? ValutesCollectionViewCell {
            
            itemCell.valute = self.localValutesArray[indexPath.row]
            itemCell.backgroundColor = .cyan
            return itemCell
            
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let valute = self.localValutesArray[indexPath.row]
        let secondViewController = SecondViewController(nibName: nil, bundle: nil)
        secondViewController.delegate = self
        secondViewController.valute = valute
        secondViewController.index = indexPath.row
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}
