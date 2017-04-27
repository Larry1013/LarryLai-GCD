//
//  ViewController.swift
//  GCDDemo
//
//  Created by Larry on 2017/4/27.
//  Copyright © 2017年 Larry. All rights reserved.
//


//參考 http://www.appcoda.com.tw/grand-central-dispatch/

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        concurrentSample();
    }
    
    
    func syncSample(){
        let queue = DispatchQueue.init(label: "sync");
        queue.sync {
            
            for i in 0..<10{
                print("i",i);
            }
        }
        
        for j in 100..<110{
            
            print("j",j);
        }

    }
    
    func asyncSample(){
          let queue = DispatchQueue.init(label: "async");
        queue.async {
            
            for i in 0..<10{
                print("i",i);
            }
        }
        
        for j in 100..<110{
            
            print("j",j);
        }

    }

    
    func qosSample(){
        
        // qos means Quality of Service
        let queue1 = DispatchQueue.init(label: "com.queue1");
        let queue2 = DispatchQueue.init(label: "com.quque2", qos: .utility, attributes: .concurrent, autoreleaseFrequency: .workItem, target: nil);
        queue1.async {
            
            for i in 0..<10{
                print("i",i);
            }
        }
        
        queue2.async {
            
            for j in 100..<110{
                print("j",j);
            }
        }
    }
    
    func concurrentSample(){
        
       // let queue = DispatchQueue.init(label: "concurrent");
        let queue = DispatchQueue.init(label: "concurrent", qos: .default, attributes: .concurrent, autoreleaseFrequency: .workItem, target: nil);
        queue.async {
            
            for i in 0..<10{
                
                print("i",i);
            }
        }
        
        queue.async {
            
            for j in 100..<110{
                
                print("j",j);
            }
        }
        
        queue.async {
            
            for x in 1000..<1010{
                
                print("x",x);
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

