import UIKit

/* COPY THIS CODE WHEN 
 * YOU START A NEW PAGE
 * BON VOYAGE!
 
 import UIKit
 import PlaygroundSupport
 
 class ViewController: DemoViewController {
 }
 
 let page = ViewController()
 
 PlaygroundPage.current.needsIndefiniteExecution = true
 PlaygroundPage.current.liveView = page
 *
 *
 */

public class FrameView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        widthAnchor.constraint(equalToConstant: 414).isActive = true
        heightAnchor.constraint(equalToConstant: 800).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

open class DemoViewController: UIViewController {
    
    public let frameView = FrameView()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(frameView)
        frameView.translatesAutoresizingMaskIntoConstraints = false
        frameView.centerInSuperview()
        
        view.addSubview(animateButton)
        animateButton.setTitle("Animate", for: [])
        animateButton.setTitleColor(.black, for: [])
        animateButton.addTarget(self, action: #selector(animateBlock), for: [.touchUpInside])
        
        view.addSubview(zoomButton)
        zoomButton.setTitle("Zoom", for: [])
        zoomButton.setTitleColor(.black, for: [])
        zoomButton.addTarget(self, action: #selector(zoomBlock), for: [.touchUpInside])
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        animateButton.frame = CGRect(x: view.bounds.width - 96, y: view.bounds.height - 76, width: 80, height: 60)
        zoomButton.frame = CGRect(x: 16, y: view.bounds.height - 76, width: 80, height: 60)
    }
    
    private let animateButton = UIButton()
    private let zoomButton = UIButton()
    
    @objc
    open func animateBlock() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: [], animations: {
            self.frameView.transform = CGAffineTransform.identity.rotated(by: .pi)
        }, completion: {_ in 
            self.frameView.transform = .identity
        })
    }
    
    @objc
    private func zoomBlock() {
        if self.frameView.transform != .identity {
            UIView.animate(withDuration: 0.2, animations: {
                self.frameView.transform = .identity
            })
            return
        }
        let scale = view.bounds.width / frameView.bounds.width
        UIView.animate(withDuration: 0.2, animations: {
            self.frameView.transform = CGAffineTransform.identity.scaledBy(x: scale, y: scale)
        })
    }
}
