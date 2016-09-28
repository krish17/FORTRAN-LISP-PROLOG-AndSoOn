!Program by Krishna Bakka
!Advance Programming Languages
!Assignment 1
!This program populates and extracts user asked column and 
!find its mean, variance and std deviation. 



!This function takes mymean, myvar and mystdev as references and also
!calls other functions within it
function computeStats(c,m,sum1,a,mymean,myVar,myStDev)
    implicit none

    integer,intent(in)::c,m
    integer,dimension(m,m),intent(in)::a
    real,intent(in)::sum1
    real,intent(out)::mymean,myVar,myStDev
    real::mean,var,stddev,computeStats
    
    mean = myMeanFx(m,sum1)
    var = myVarFx(mean,m,c,a)
    stddev = myStdDevFx(var)
    
    mymean = mean 
    myVar = var
    myStDev = stddev
    
    contains
!This function finds the mean
    function myMeanFx(m,sum1)result(mean1)
       integer::m
       real::mean1,sum1
       mean1 = sum1/m
       return
       end function myMeanFx
!This function finds the variance      
    function myVarFx(mean1,m,c,a) result(var1)
       integer::m,c,i
       real::mean1,var1,sum2
       integer,dimension(m,m)::a
       sum2 = 0
       do i=1,m,1
       		sum2 = sum2+ ((a(i,c)-mean1))**2
       end do
       var1 = sum2/m
       return
       end function myVarFx
!This function finds the std deviation   
    function myStdDevFx(var1)result(stdDev)
       real::var1,stdDev
       stdDev = sqrt(var1)
       return
    end function myStdDevFx

end function computeStats

!main function starts from here
program assignment1
    implicit none
! m is dimension of the matrix, c is column extracted and a is array
    integer :: i,j,m,c
    real :: mymean,myStDev,myVar,sum1,computeStats,k
    integer, dimension (:,:), allocatable ::a
    
    mymean = 0;
    myVar = 0;
    myStDev = 0;
    
    print*,"Enter the dimension of the Square Matrix"
    read*,m
    
    allocate (a(m,m))
    
    print*, "Enter the elements of the matrix"
    
    do i=1,m,1
       do j=1,m,1
       	  a(i,j) = populateMatrix()
       end do
    end do
    
    call showMeTheMatrix(m,a)
    
    print*,"Enter the column number to be extracted"
    read*,c
    
    sum1 = extractColumn(c)
    k = computeStats(c,m,sum1,a,mymean,myVar,myStDev)
    
    print*,""
    print*,"The following are calculated for the given data"
    print*,""
    print*, "Mean = ", mymean
    print*,""
    print*,"Variance = ",myVar
    print*,""
    print*,"Standard Deviation =", myStDev
    
    contains
!This function fills the matrix    
    function populateMatrix() result(k) 
       integer::k
       read*,k
    end function populateMatrix
    
!This function extracts the user asked column    
    function extractColumn(c)result(sum)
       integer::i,c
       real::sum
       print*,"The elements of the extracted column are"
       print*,""
       do i=1,m,1
          print*,(a(i,c))
       end do
       sum = 0
       do i=1,m,1
          sum = sum + a(i,c)
       end do 
    end function extractColumn
    
!This subroutine shows the matrix in the terminal   
    subroutine showMeTheMatrix(m,array)
       integer,dimension(m,m)::array
       integer::m
       print*,"The Matrix is"
       print*,""
       do i=1,m,1
       	   print*,(array(i,j),j=1,m,1)
       end do
    end subroutine showMeTheMatrix

end program assignment1