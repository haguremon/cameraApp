//
//  ViewController.swift
//  cameraApp
//
//  Created by IwasakIYuta on 2021/06/29.
//

import UIKit //UIKitのフレームワークでその中のクラスを使用

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    //このボタンを押したときにアラート出したいけどね
    @IBAction func cameraBarButton(_ sender: UIBarButtonItem) {
        let camera = UIImagePickerController.SourceType.camera //画像の取得方法 //UIImagePickerControllerカメラ類を表現するクラス
        if UIImagePickerController.isSourceTypeAvailable(camera) { //カメラが無いデバイスでは実行できないように設定
            let picker = UIImagePickerController()
            picker.sourceType = camera
            picker.delegate = self //selfはViewController自身
            self.present(picker, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.imageView.image = image // imageView.imageの方がUIImge型なのでダウンキャストしないといけない
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addImageViewButton(_ sender: UIBarButtonItem) {
        let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self
            present(picker, animated: true)
            //self.present(picker, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
extension ViewController : UIImagePickerControllerDelegate {

}
extension ViewController : UINavigationControllerDelegate {

}
