import UIKit



class ViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .blueColor()
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		let s = SecondViewController()
		presentViewController(s, animated: true, completion: nil)
	}
	
}



class SecondViewController: UIViewController {
	
	let worker = Worker()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .redColor()
		let b = UIButton(frame: view.bounds)
		b.addTarget(self, action: "pressed:", forControlEvents: .TouchUpInside)
		view.addSubview(b)
		
		worker.delegate = self
		worker.work()
	}
	
	func pressed(sender: UIButton) {
		dismissViewControllerAnimated(true, completion: nil)
	}
	
	deinit {
		print("SecondViewCOntroller deinit")
	}
	
}

extension SecondViewController: WorkerDelegate {
	
	func workerDidSomething() {
		print("workerDidSomething")
	}
	
}

