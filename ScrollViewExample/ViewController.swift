//
//  ViewController.swift
//  ScrollViewExample
//
//  Created by Junior Samaroo on 2017-02-14.
//  Copyright © 2017 Junior Samaroo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    var images = [UIImageView]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var contentWidth: CGFloat = 0.0
        
        for x in 0...2 {
            var image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            var newX: CGFloat = 0.0
            
            // top left corner is 0.0
            // this logic mvoes each image a screen width away from the next
            newX = view.frame.midX + view.frame.size.width * CGFloat(x)
            
            // increase content width to size of image content to scroll
            contentWidth += newX
            
            scrollView.addSubview(imageView)
            
            // a views coordinate system dependent on its parent, so we add it after its added to scroll view
            // -75 for half of the image, because coordiante system starts from top left of view
            imageView.frame = CGRect(x: newX - 75, y: (view.frame.size.height / 2) - 75, width: 150, height: 150)
        }
        
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
        
        print("Count: \(images.count)")
    }

}

