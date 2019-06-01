program main   
    
    use, intrinsic :: iso_c_binding
    implicit none
    include "fftw3.f03"
       
    integer, parameter :: n = 1024
    real(c_double), allocatable :: array(:)
    complex(c_double_complex), allocatable :: result_array(:)
    type(c_ptr) :: plana

    real(16) :: x = 0.0
    real(16) :: dx=1/real(n-1)
    real(16) :: val
    integer::i

    open (unit = 1, file = "../res/signal")             ! sygnał
    open (unit = 2, file = "../res/signal_frequency")   ! widmo transformaty

    allocate(array(n))
    allocate(result_array(n/2+1))

    do i=1,n
        x=x+dx
        array(i)=sin(2*3.1415*x*200)+2*sin(2*3.1415*x*400)
        write(1,*) x," ",array(i)
    end do
  
    plana = fftw_plan_dft_r2c_1d(size(array), array, result_array, FFTW_ESTIMATE+FFTW_UNALIGNED)
    call fftw_execute_dft_r2c(plana, array, result_array)

    do i=1,n/2+1
        val=abs(result_array(i))
        if(val /= val)val=0.0
        write(2,'(I15," ", F15.10)')i, val
    end do
  
    call fftw_destroy_plan(plana)
      
end program main