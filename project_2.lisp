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

(defthm pow-pow-1 (implies (and (posp m) (natp n)) (<= (pow (- m 1) n)  (pow m n))))

(defthm pow-n-1 (implies (and (natp n) (posp n))
              (<= (pow (1- n) (1- n)) (pow n (1- n)))))

; Suggested follow-up Induction step 1.1
(defthm add-pow (implies (and (natp n)
              (<= 0 n)
              (< 0 n)
              (<= (fact (1- n))
                  (pow (1- n) (1- n)))
              (<= (+ (- (pow (+ -1 n) (+ -1 n)))
                     (* n (pow (+ -1 n) (+ -1 n))))
                  (* n (pow n (+ -1 n)))))
         (<= (fact (+ -1 n))
             (pow (+ -1 n) (+ -1 n)))))
(defthm less-equal (implies (and (natp a)
                                 (natp b)
                                 (natp c)
                                 (<= a b)
                                 (<= b c))
                            (<= a c)))
                            
                            

; Additonal suggested follow-up induction step 1.2
(defthm add-pow-n (implies (and (natp n)
                                (< 0 n))
                           (<= (fact (+ -1 n)) (pow n (+ -1 n))))
  :hints (("Goal" :do-not-induct t)))


(defthm add-pow-n (implies (and (natp n)
              (<= 0 n)
              (< 0 n)
              (<= (fact (1- n))
                  (pow (1- n) (1- n)))
              (<= (+ (- (pow (+ -1 n) (+ -1 n)))
                     (* n (pow (+ -1 n) (+ -1 n))))
                  (* n (pow n (+ -1 n)))))
         (<= (fact (+ -1 n))
             (pow n (+ -1 n)))))
#|             

(defthm pow-n-fact-n-1 (implies (and (natp n) (> n 0) (<= (pow (1- n) n)  (pow n n)))
         (<= (fact (1- n)) (pow (1- n) (1- n)))))

(defthm fact-pow-induct
  (implies (and (posp n)
        (<= (fact (1- n)) (pow (1- n) (1- n))))
       (<= (fact n) (pow n n))))


(defthm fact-pow-induct (IMPLIES (and (posp n)
              (<= (FACT (+ -1 N))
                  (POW (+ -1 N) (+ -1 N))))
         (<= (FACT (+ -1 N)) (POW N (+ -1 N)))))
|#

; First suggested Induction Step (1.0)
(defthm fact-pow-induct (implies (and (natp n) 
                                      (> n 0) 
                                      (<= (fact (1- n)) (pow (1- n) (1- n)))
                                      (<= (pow (1- n) n)  (pow n n))) ; I added this in
                                 (<= (fact (1- n)) (pow n (1- n)))))
(thm (implies (natp n) (<= (fact n) (pow n n))))
; MAIN
(thm (implies (natp n) (<= (fact n) (n-to-n n))))
