//
//  ViewController.swift
//  Swift Practice # 54 passport
//
//  Created by Dogpa's MBAir M1 on 2021/8/7.
//

import UIKit

class ViewController: UIViewController {
    
    //上方UIImageView的 outlet collection
    @IBOutlet var circleToStarImageView: [UIImageView]!
    
    //下方Button的 Outlet collection
    @IBOutlet var numbersOfPassword: [UIButton]!
    
    //建立空字串
    var timesOfinputNumber = ""
    
    //建立密碼
    var password = "1314"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //建立檢察密碼後跳出的警告或是通過的提示
    func PasswordCheck () {
        //判斷如果輸入字串等於密碼字串
        if timesOfinputNumber == password {
            //建立一個提醒視窗並顯示下列的畫面
            let alertController = UIAlertController(title: "您好登入成功", message: "請瀏覽後續資料", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "進入下一頁", style: .default) { _ in self.reset()
            }
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            
        } else {//不等於的話執行下面的提醒事項
            let alertController = UIAlertController(title: "登入失敗", message: "你想幹什麼", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Back", style: .default) { _ in self.reset()
            }
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    //重設的function
    func reset () {
        //透過迴圈執行uiimage collection內的isHighlighted = false
        for x in circleToStarImageView {
            x.isHighlighted = false
        }
        //字串重新回到空的字串
        timesOfinputNumber = ""
    }
    
    
    //輸入字數button與uiimage改變的連動function
    func ImageViewChange () {
        //已輸入空字串的此數為基準
        switch timesOfinputNumber.count {
        //如果輸入1次
        case 1:
            for x in 0...3{circleToStarImageView[x].isHighlighted = false}
            for x in 0...0{circleToStarImageView[x].isHighlighted = true}
        //如果輸入2次
        case 2:
            for x in 0...3{circleToStarImageView[x].isHighlighted = false}
            for x in 0...1{circleToStarImageView[x].isHighlighted = true}
        //如果輸入3次
        case 3:
            for x in 0...3{circleToStarImageView[x].isHighlighted = false}
            for x in 0...2{circleToStarImageView[x].isHighlighted = true}
        //如果輸入4次
        case 4:
            for x in 0...3{circleToStarImageView[x].isHighlighted = false}
            for x in 0...3{circleToStarImageView[x].isHighlighted = true}
            //執行密碼檢查
            PasswordCheck()
        //這些次數之外執行
        default:
            for x in 0...3 {circleToStarImageView[x].isHighlighted = false}
        }
    }
    
    //button 0 - 9 的 action
    @IBAction func passwordInput(_ sender: UIButton) {
        //判斷如果還沒輸入到4個字的話
        if timesOfinputNumber.count != 4{
            //button的標題值加入到空字串內
            timesOfinputNumber += sender.currentTitle!
        }
        //執行照片更換的function
        ImageViewChange()
        //執行照片更換的function
        print(timesOfinputNumber)
    }
    
    
    //刪除鍵button的 action
    @IBAction func deleteSet(_ sender: Any) {
        //判斷如果字串沒有回到空字串
        if timesOfinputNumber.count != 0 {
            //刪除字串內的最後一個字
            timesOfinputNumber.removeLast()
        }
        //執行照片更換的function
        ImageViewChange()
        //列印目前密碼字串
        print(timesOfinputNumber)
    }
    

}

