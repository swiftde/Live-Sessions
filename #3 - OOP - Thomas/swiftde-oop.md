autoscale: true
slidenumbers: true

# Objektorientierte Programmierung
---

# Geschichte

---

# Warum "Objektorientierung"?
- Neue Denkweise in der Anwendungsentwicklung
  - Daten(-typen) und Funktionen so schachteln, dass diese der Realität entsprechen
  - "Sprechender" Code
- *Kostenreduzierung*
- *Erhöhung der Effizienz*

----

# Programmiersprachen (chronologisch)
- Simula 67 (1967)
- Smalltalk (1972)
- Objective-C (1983)
- Java (1995)

[...]

---

# Allgemeines

---

Objektorientierte Programmierung bezieht sich auf das Schachteln von Code innerhalb von **Klassen**.
Eine Klasse besitzt sowohl **Eigenschaften** als auch **Methoden**.
Sie ist außerdem gleichzeitig die Ausprägung eines **Datentyps**.

- **Eigenschaften** bzw. **Attribut** oder **Feld**
  beschreiben die *Daten* innerhalb eines Objekts<br /><br />
- **Methoden**
  beschreiben das *Verhalten* eines Objektes
  bzw. dessen *funktionalität*.
  Sie arbeiten auf objektinterne Daten.

Die Instanz einer Klasse nennt man **Objekt**.

---

Objekte können mittels **Nachrichten** miteinander kommunizieren.

### Nachrichtentypen:

- **Accessoren**: "Gib mir einen Datensatz!"
- **Mutatoren**: "Modifiziere einen Datensatz!"
  *oder:* "Hol dir einen Datensatz!"

---

# Methode vs. Funktion

---

Eine *Methode* kann im Gegensatz zu einer *Funktion* auf *objektinterna* zugreifen.

Das heißt: Mit einer Methode kann man, zusätzlich zur Kapselung mehrerer Anweisungen, auf *Eigenschaften* und *Methoden* des Objekts zugreifen.

---

# Vererbung

---

Klassen könnnen ihr *Verhalten*, ihren *Datentyp* und ihre *Eigenschaften* an eine andere vererben.

- Bezeichnung der vererbenden Klasse: **Elternklasse** oder **Superklasse**
- Bezeichnung der erbenden Klasse: **Unterklasse** bzw. **Kindklasse**

---

# Konstruktoren
# und
# Destruktoren

---

Spezialmethoden, die bei **Initialisierung** eines Objekts beziehungsweise **Deinitialisierung** eines Objekts gerufen werden.

In Swift: `init()` und `deinit()`

---

# Sichtbarkeiten

---

Die **Sichtbarkeit** oder der **Scope** einer *Eigenschaft* bzw. *Methode* legt fest, aus welchem *Kontext* heraus diese zu erreichen ist.

- **Public**: Die *Eigenschaft*/*Methode* kann von *überall* aus angesprochen und manipuliert werden
- **Internal**: Die *Eigenschaft*/*Methode* kann von *allen Dateien innerhalb eines Moduls*[^1] aus angesprochen und manipuliert werden
- **Private**: Die *Eigenschaft*/*Methode* kann *nur in der akutellen Datei* angesprochen und manipuliert werden

[^1]: [The Swift Programming Language (Swift 2.1) - Access Control](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/AccessControl.html)

---

# Klasse vs. Instanz

---

- Eine *Klassenvariable*/*Klassenmethode* beeinflusst **alle** Objekte
- Wird eine Klassenvariable geändert, so ändert sich diese für *alle* Objekte!
- Eine *Instanzvariable*/*Instanzmethode* beeinflusst nur das aktuelle Objekt

*Klassenvariablen* bzw. *-methoden* werden mit dem Schlüsselwort **`static`** versehen.

---

# Verträge

---

Spezielle Klasse:

- Enthällt ausschließlich:
    - *Methodensignaturen* + *Sichtbarkeit*
    - *Datentyp*

Dient dazu, *Implementierungen* eines Vertrages bestimmte Gegebenheiten erfüllen zu lassen (z.B. das Vorhandensein bestimmter Methoden oder eines bestimmten Datentyps).

Die **Signatur** einer *Methode* umfasst ihren *Namen* und ihre *Parameter*.

In Swift: **Protokolle**

---

# Unified
# Modeling
# Language

---

Vereinheitlichung von Diagrammen, um Klassen, Objekte und deren Interaktion aufzuzeigen.

- Kompliziert
- Haarsträubend
- Basics sind gut

---

![inline](http://image.slidesharecdn.com/03-uml-151002071928-lva1-app6891/95/4-uml-36-638.jpg?cb=1452167759)

---

# Entwurfsmuster

---
![right](http://ecx.images-amazon.com/images/I/51Q-RLSadrL.jpg)

Gegebene Klassenkonstellationen, um ein bestimmtes Szenario abzubilden.[^2]

**Achtung**: Pattern bitte nur als Inspiration benutzen!

[^2]: [Design Patterns - Elements of Reusable Object-Oriented Software](http://www.amazon.de/Patterns-Elements-Reusable-Object-Oriented-Software/dp/0201633612)

---

# Fragen?

Gerne beantworte ich offene Fragen in Slack[^3] und in Skype[^4].


[^3]: [SwiftDE Community in Slack](https://slack.swiftde.net)

[^4]: Mein Skype Nickname: *osh-fan*

---

# *Demo*
