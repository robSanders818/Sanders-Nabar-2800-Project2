(definec pow (n :nat count :nat) :nat
  (if (zp count)
    1
    (* n (pow n (1- count)))))

(definec n-to-n (n :nat) :nat
  (pow n n))

(definec fact (n :nat) :nat
  (if (zp n)
    1
    (* n (fact (1- n)))))

(defthm pow-pow-1 (implies (and (natp m) (> m 0) (natp n)) (<= (pow (- m 1) n)  (pow m n))))

(defthm <=-trans (implies (and (natp a)
                               (natp b)
                               (natp c)
                               (<= a b)
                               (<= b c))
                          (<= a c)))

; Additonal suggested follow-up induction step 1.2
(defthm add-pow-n (implies (and (natp n)
                                (> n 0)
                                (<= (fact (+ -1 n)) (pow (+ -1 n) (+ -1 n))))
                           (<= (fact (+ -1 n)) (pow n (+ -1 n))))
  :hints (("Goal''" :use (:instance <=-trans (a (fact (+ -1 n))) (b (pow (+ -1 n) (+ -1 n))) (c (pow n (+ -1 n)))))))

; MAIN
(thm (implies (natp n) (<= (fact n) (n-to-n n))))
