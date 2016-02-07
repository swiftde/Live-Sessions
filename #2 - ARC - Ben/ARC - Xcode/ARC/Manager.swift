import Foundation

protocol WorkerDelegate: class {
	func workerDidSomething()
}

let url = "https://upload.wikimedia.org/wikipedia/commons/e/ec/London_actually_surveyed_by_Wm_Morgan_1682.jpg"

class Worker {
	
	weak var delegate: WorkerDelegate?
	
	func work() {
		NSURLSession.sharedSession().dataTaskWithRequest(NSURLRequest(URL: NSURL(string: url)!)) {
			
			[weak self] data, _, error in
			
			self?.delegate?.workerDidSomething()
			}.resume()
	}
	
	deinit {
		print("Worker deinit")
	}
	
}
