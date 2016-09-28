(princ "This program performs linear regression on user asked number of samples.")
(terpri)
(princ "Pleas give me the number of samples you want to enter: ")
(setf samples(read));reads the number of samples user gives


(setf xarray (make-array '(100):initial-element 0))
(princ "Enter the x values one by one each followed by enter: ")
(terpri)
;creates and reads the xarray
(dotimes(i samples)
  (setf (aref xarray i)( read)))

(setf yarray(make-array '(100):initial-element 0))
(terpri)

(princ "Enter the y values one by one each followed by enter: ")
(terpri)
;reads the y values
(dotimes(i samples)
    (setf (aref yarray i)(read)))
(terpri)

;array filled after multiplying xi and yi
(defvar xy(make-array '(100):initial-element 0))
(defvar sumxy 0)
(loop for i from 0 to samples
    do
   (setf (aref xy i) (* (aref xarray i) (aref yarray i))))

;sumxy stores the sum of xy array
(setf sumxy (reduce #'+ xy))


(defvar xsqr (make-array '(100):initial-element 0))
(loop for i from 0 to samples
    do 
    (setf (aref xsqr i) (* (aref xarray i) (aref xarray i))))

;this function converts the xarray into xarray list
(defun array-to-list (xarray)
  (map 'list (lambda (x) xarray)))
  
;this function convcerts the yarray into yarray list
(defun array-to-list (yarray)
  (map 'list (lambda (x) yarray)))

;sums all the elements of xarray
(setf sumy (reduce #'+ yarray))

;sums all the elements of yarray
(setf sumx (reduce #'+ xarray))

;multiplies the sumx with sumy
(defvar sumxsumy 0)
(setf sumxsumy (* sumx sumy))

;squares the sumx
(defvar sumxsqr 0)
(setf sumxsqr (reduce #'+ xsqr))

;squares the sum of the elements of the array 
(defvar sumwholexsqr 0)
(setf sumwholexsqr (* sumx sumx))

(defvar a1 0)
(terpri)
;finds a1 that is slope
(setf a1 (/ (- (* samples sumxy) sumxsumy) (- (* samples sumxsqr) sumwholexsqr)))

;finds the mean of x values
(defvar meanx 0)
(setf meanx (/ sumx samples))

;finds the mean of y values
(defvar meany 0)
(setf meany (/ sumy samples))

;finds the a0
(defvar a0 0)
(setf a0 (- meany (* a1 meanx)))

(terpri)
;prints the X and Y list
(princ "For the following set of samples:")
(terpri)
(princ "  X       Y") 
(terpri)
(loop for i from 0 to samples
do
(format t "  ~D      ~D" (aref xarray i) (aref yarray i))
  (terpri))
  (terpri)


;prints the equation
(terpri)
(princ "The equation that describes this system is: ")
(format t "Y = ~f + ~fX" a0 a1)


