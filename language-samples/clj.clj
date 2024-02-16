;; Namespace
(ns learnclojure)

;; Import
(use '[clojure.set :only [intersection]])
(use 'clojure.set)
(require 'clojure.string)
(import java.util.Date)

(ns test
  (:require
    [clojure.string :as str]
    [clojure.set :as set])
  (:import java.util.Date
           java.util.Calendar))

;; Strings
"Hello"
"Hello World"
(str "Hello" " " "World")

;; Math
(+ 1 1)       ; => 2
(- 2 1)       ; => 1
(* 1 2)       ; => 2
(/ 2 1)       ; => 2
(+ 1 (- 3 2)) ; = 1 + (3 - 2) => 2

;; Comparison
(= 1 1) ; => true
(= 2 1) ; => false
(not true) ; => false

;; Types

;; Clojure uses Java's object types for booleans, strings and numbers.
;; Use `class` to inspect them.
(class 1)     ; Integer literals are java.lang.Long by default
(class 1.)    ; Float literals are java.lang.Double
(class "")    ; Strings always double-quoted, and are java.lang.String
(class false) ; Booleans are java.lang.Boolean
(class nil)   ; The "null" value is called nil

;; Specials
'(+ 1 2) ; => (+ 1 2)
(eval '(+ 1 2))  ; => 3
(class '(1 2 3)) ; => clojure.lang.PersistentList

;; Collections & Sequences
(class [1 2 3])   ; => clojure.lang.PersistentVector
(seq? [1 2 3])    ; => false
(range 4)         ; => (0 1 2 3)
(range)           ; => (0 1 2 3 4 ...) (an infinite series)
(take 4 (range))  ;  (0 1 2 3)
(cons 4 [1 2 3])  ; => (4 1 2 3)
(cons 4 '(1 2 3)) ; => (4 1 2 3)
(map inc [1 2 3]) ; => (2 3 4)
(filter even? [1 2 3]) ; => (2)
(reduce + [1 2 3 4])
(reduce conj [] '(3 2 1))
{:a 1 :b 2 :c 3}
(hash-map :a 1 :b 2 :c 3)
(def stringmap {"a" 1, "b" 2, "c" 3})
(def keymap {:a 1, :b 2, :c 3})
(:b keymap) ; => 2
(class #{1 2 3}) ; => clojure.lang.PersistentHashSet
; Test for existence by using the set as a function:
(#{1 2 3} 1) ; => 1
(#{1 2 3} 4) ; => nil

;; Functions

(fn [] "Hello World")   ; => fn

((fn [] "Hello World")) ; => "Hello World"

(def x 1)
x

(def hello-world (fn [] "Hello World"))
(hello-world) ; => "Hello World"

(defn hello-world [] "Hello World")

(defn hello [name]
  (str "Hello " name))
(hello "Steve") ; => "Hello Steve"

(def hello2 #(str "Hello " %1))
(hello2 "Julie") ; => "Hello Julie"

(defn hello3
  ([] "Hello World")
  ([name] (str "Hello " name)))
(hello3 "Jake") ; => "Hello Jake"
(hello3)        ; => "Hello World"

(defn count-args [& args]
  (str "You passed " (count args) " args: " args))
(count-args 1 2 3) ; => "You passed 3 args: (1 2 3)"

(defn hello-count [name & args]
  (str "Hello " name ", you passed " (count args) " extra args"))
(hello-count "Finn" 1 2 3) ; => "Hello Finn, you passed 3 extra args"

;; Logic
(if false "a" "b") ; => "b"

(if false "a") ; => nil

; Use let to create temporary bindings
(let [a 1 b 2]
  (> a b)) ; => false

; Group statements together with do
(do
  (print "Hello")
  "World") ; => "World" (prints "Hello")

; Functions have an implicit do
(defn print-and-say-hello [name]
  (print "Saying hello to " name)
  (str "Hello " name))
(print-and-say-hello "Jeff") ;=> "Hello Jeff" (prints "Saying hello to Jeff")

; So does let
(let [name "Urkel"]
  (print "Saying hello to " name)
  (str "Hello " name)) ; => "Hello Urkel" (prints "Saying hello to Urkel")

(->
   {:a 1 :b 2}
   (assoc :c 3) ;=> (assoc {:a 1 :b 2} :c 3)
   (dissoc :b)) ;=> (dissoc (assoc {:a 1 :b 2} :c 3) :b)

(->>
   (range 10)
   (map inc)     ;=> (map inc (range 10)
   (filter odd?) ;=> (filter odd? (map inc (range 10))
   (into []))    ;=> (into [] (filter odd? (map inc (range 10)))
                 ; Result: [1 3 5 7 9]

(as-> [1 2 3] input
  (map inc input);=> You can use last transform's output at the last position
  (nth input 2) ;=>  and at the second position, in the same expression
  (conj [4 5 6] input 8 9 10)) ;=> or in the middle !
                               ; Result: [4 5 6 4 8 9 10]

(clojure.string/blank? "") ; => true

;; Interop

(import java.util.Date)

(Date.) ; <a date object>

(. (Date.) getTime) ; <a timestamp>
(.getTime (Date.)) ; exactly the same thing.

(System/currentTimeMillis) ; <a timestamp> (system is always present)

(import java.util.Calendar)
(doto (Calendar/getInstance)
  (.set 2000 1 1 0 0 0)
  .getTime) ; => A Date. set to 2000-01-01 00:00:00

;; STM
;; Software Transactional Memory is the mechanism clojure uses to handle
;; persistent state. There are a few constructs in clojure that use this.

(def my-atom (atom {}))

(swap! my-atom assoc :a 1) ; Sets my-atom to the result of (assoc {} :a 1)
(swap! my-atom assoc :b 2) ; Sets my-atom to the result of (assoc {:a 1} :b 2)

; Use '@' to dereference the atom and get the value
my-atom  ;=> Atom<#...> (Returns the Atom object)
@my-atom ; => {:a 1 :b 2}

; Here's a simple counter using an atom
(def counter (atom 0))
(defn inc-counter []
  (swap! counter inc))

(inc-counter)
(inc-counter)
(inc-counter)
(inc-counter)
(inc-counter)

@counter ; => 5

;; Macros

~@hi
