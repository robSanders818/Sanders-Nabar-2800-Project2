definec pow (n :nat count :nat) :nat
  (if (zp count)
    1
    (* n (pow n (1- count)))))

(definec n-to-n (n :nat) :nat
  (pow n n))

(definec fact (n :nat) :nat
  (if (zp n)
    1
    (* n (fact (1- n)))))

(defthm pow-pow-1 (implies (and (natp n) (> n 0) (natp m)) (<= (pow (- n 1) m)  (pow n m))))

(defthm <=-trans (implies (and (natp a)
                               (natp b)
                               (natp c)
                               (<= a b)
                               (<= b c))
                          (<= a c)))

; MAIN
(thm (implies (natp n) (<= (fact n) (n-to-n n)))
      :hints (("Subgoal *1/4''" :use (:instance <=-trans (a (fact (+ -1 n))) (b (pow (+ -1 n) (+ -1 n))) (c (pow n (+ -1 n)))))))
