//
//  VideoViewController.swift
//  CustomVideo
//
//  Created by Dat Bui on 6/30/20.
//  Copyright © 2020 Dat Bui. All rights reserved.
//

import UIKit
import AVFoundation

class VideoViewController: BaseViewController {
  
  @IBOutlet weak var btnCamera: UIButton!
  @IBOutlet weak var viewCamera: UIView!
  var captureSession: AVCaptureSession!
  var videoOutput: AVCaptureMovieFileOutput!
  var videoPreviewLayer: AVCaptureVideoPreviewLayer!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configUI()
    captureSession = AVCaptureSession()
    captureSession.sessionPreset = .medium
    guard let backCamera = AVCaptureDevice.default(for: .video) else { return }
    do {
      let input = try AVCaptureDeviceInput(device: backCamera)
      
      videoOutput = AVCaptureMovieFileOutput()
      
      if (captureSession.canAddInput(input) && captureSession.canAddOutput(videoOutput)) {
        captureSession.addInput(input)
        captureSession.addOutput(videoOutput)
        setupLinePreview()
      }
    } catch let err {
      print("Error Unable to initialize back camera:  \(err.localizedDescription)")
    }
  }
  
  private func configUI() {
    btnCamera.fullBorderShadow(radius: 10, offSet: .zero, opacity: 0.8, color: AppColor.purple)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.captureSession.stopRunning()
  }
  
  private func setupLinePreview() {
    videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
    videoPreviewLayer.videoGravity = .resizeAspectFill
    videoPreviewLayer.connection?.videoOrientation = .portrait
    viewCamera.layer.addSublayer(videoPreviewLayer)
    
    DispatchQueue.global(qos: .userInitiated).async {
      self.captureSession.startRunning()
      
      DispatchQueue.main.async {
        self.videoPreviewLayer.frame = self.viewCamera.bounds
      }
    }
  }
}
