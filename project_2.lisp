; Ohm Nabar and Robert Sanders

; pow- multiply n to itself count times (when count is 0, the result is 1)
(definec pow (n :nat count :nat) :nat
  (if (zp count)
    1
    (* n (pow n (1- count)))))

; n-to-n- multiply n to itself n times
(definec n-to-n (n :nat) :nat
  (pow n n))

; fact- the multiplication of {n, n-1, ... 1} (when n is 0, the result is 1)
(definec fact (n :nat) :nat
  (if (zp n)
    1
    (* n (fact (1- n)))))

; with the power unchanged, applying pow with base (1- n) always results in an answer
; less than or equal to the answer produced by applying pow with base n
(defthm pow-pow-base (implies (and (natp n) (> n 0) (natp m)) (<= (pow (1- n) m)  (pow n m))))

; the <= operator is transitive over the natural numbers
(defthm <=-trans (implies (and (natp a)
                               (natp b)
                               (natp c)
                               (<= a b)
                               (<= b c))
                          (<= a c)))

; our main theorem- the factorial of n is less than or equal to n^n for all natural numbers
(defthm fact-n-to-n (implies (natp n) (<= (fact n) (n-to-n n)))
     :hints (("Subgoal *1/4''" :use (:instance <=-trans (a (fact (+ -1 n))) (b (pow (+ -1 n) (+ -1 n))) (c (pow n (+ -1 n)))))))
