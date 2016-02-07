# ARC

#### automatic reference counting

---

# Arc

- überträgt Aufgabe des Referenzen-Zählens von Programmierer zu Compiler

- vorher (MRC - manual reference counting)
	- retain() -> rc inkrementieren
	- release() -> rc dekrementieren
- ARC -> Compiler fügt diese Aufrufe selbstständig ein

---

# Unterschied Garbage Collector

- kein Hintergrundprozess
- Programmierer muss retain cycles manuell verhindern
	- weak und strong references

---

# Beispiel

```Swift
class Dog {
	init() { }
}
class DogOwner {
	var dog: Dog // strong reference
	init(dog: Dog) {
		self.dog = dog
	}
}
let dog = Dog()
let person = DocOwner(dog: dog)
```

^ Hier gibt es keine Probleme, wenn person deallokiert wird, wird auch dog deallokiert.

---

# Beispiel

```Swift
class Dog {
	var dogOwner: DogOwner
	init() { }
}
class DogOwner {
	var dog: Dog // strong reference
	init(dog: Dog) {
		self.dog = dog
		self.dog.dogOwner = self
	}
}
let dog = Dog()
let person = DocOwner(dog: dog)
```

^ Hier gibt es einen retain cycle. Warum -> next slide

---

# Beispiel

- eine Instanz wird stets dann deinitialisiert, wenn rc == 0
- strong reference (default) -> retain()
- weak reference ERHÖHT NICHT den rc!
- wird ein Objekt deinitialisiert, werden gleichzeitig alle strong references deinitialisiert

---

# Beispiel

```Swift
class Dog {
	var dogOwner: DogOwner // strong
	init() { }
}
class DogOwner {
	var dog: Dog // strong reference
	init(dog: Dog) {
		self.dog = dog
		self.dog.dogOwner = self
	}
}
let dog = Dog()
// Nach dieser Zeile hat dog eine strong reference auf person
// und person eine auf dog (-> retain cycle)
let person = DocOwner(dog: dog)
```

---

# Beispiel

```Swift
class Dog {
	weak var dogOwner: DogOwner
	init() { }
}
class DogOwner {
	var dog: Dog // strong reference
	init(dog: Dog) {
		self.dog = dog
		self.dog.dogOwner = self
	}
}
let dog = Dog()
let person = DocOwner(dog: dog)
```

---

# Anderes Beispiel

```Swift
protocol WorkerDelegate: class {
    func workerDidLoadSomething()
}
class Worker {
    weak var delegate: WorkerDelegate?
    var completion: ((NSData?, NSURLResponse?, NSError?) -> Void)?
    func work() {
        completion = { _,_,_ in
            self.delegate?.workerDidLoadSomething()
        }
        NSURLSession.sharedSession()
        .dataTaskWithRequest(NSURLRequest(URL: NSURL(string: "https://www.google.de")!), 
        completionHandler: completion!).resume()
    }
}
```

^ Worker wird nie deinitialisiert!

---

# Closures

- Closures verlangen immer explizit self
	- nicht, um den Programmierer zu ärgern
	- macht darauf aufmerksam, dass hier ein retain cycle entstehen kann!

---

# Anderes Beispiel

Problem liegt also hier:

```Swift
completion = { _,_,_ in
        self.delegate?.workerDidLoadSomething()
    }
```

->

```Swift
completion = { [weak self] _,_,_ in
        self?.delegate?.workerDidLoadSomething()
    }
```

---

![fit](allthethings.jpg)

---

# weak / unowned

- beide verhindern retain cycles!
- weak gibt Optional<Self> zurück
- unowned kann zur Laufzeit crashen
- weak verwenden, wenn Objekt zur Aufruf-Zeit nil sein könnte (Netzwerk-Request z.B.)
- unowned wenn dies nicht möglich ist (UIView-Animationen z.B.)

---

# Benutzung des Workers

```Swift
class ViewController: UIViewController, WorkerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let worker = Worker()
        worker.delegate = self
        worker.work()
    }
    
    func workerDidLoadSomething() {
        print("Yeah, worker did load something!!!")
    }

}
```

---

# Anderes Problem

- durch [weak self] wird der Worker gar nicht mehr referenziert und verschwindet sofort
- Hilfe: Code Zeile für Zeile durchschauen und Referenz nachzählen

---

# Anderes Problem

```Swift
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Worker wird initialisiert -> rc = 1
        let worker = Worker()
        worker.delegate = self
        worker.work()
        
        // Methode vorbei -> worker wird deinitialisiert
    }
```

---

# Lösung für dieses Problem

- strong reference auf worker in dem Controller!

```Swift
class ViewController: UIViewController, WorkerDelegate {

	let worker = Worker() // strong
	
    override func viewDidLoad() {
        super.viewDidLoad()
        worker.delegate = self
        worker.work()
    }
    
    func workerDidLoadSomething() {
        print("Yeah, worker did load something!!!")
    }

}
```

^ Worker wird dann deinitialisiert, wenn Controller deinitialisiert wird.

---

# Was macht der Compiler genau?

ACHTUNG: kein valider Swift-Code!

```Swift
class ViewController: UIViewController, WorkerDelegate {

	let worker = Worker()
	worker.retain()
	
	deinit {
		worker.release()
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
        worker.delegate = self
        worker.work()
    }

}
```

---

# Swift und ARC

- ARC ist in Swift standard und es ist nicht möglich, MRC zu nutzen
- in Closures stets darauf achten, self zu 'weaken'
- unowned kann zur Runtime crashen!
- global definierte Variablen werden über die App-Laufzeit hinweg nie deinitialisiert!
- static Variablen (singleton) werden ebenfalls nie deinitialisiert

---

# Interessant zu wissen

- bei dispatch_...-Aufrufen muss [weak self] nicht verwendet werden
	- lassen keine retain cycles entstehen

---

# DEMO