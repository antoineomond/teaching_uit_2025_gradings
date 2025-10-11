# Report
The project has been handed-in in time.
The project doesn't use any shortcuts that reduce the functionality of the program nor the difficulty of the assignment (e.g., using share file system of the cluster instead of MPI communications).

## introduction
The problem is understood and presented.

## sequential
The design of the sequential solution is presented and explained.

It is explained how to compile and run the solution.
The code compiles, terminates correctly, and creates sobel and emboss filtered images.
The implementation works for any image sizes.

## parallel
The design of the parallel solution and how the workload is distributed are presented and explained.
The parallel solution is using C/C++, MPI and OpenMP.
The work it parallelises is the filtering of one image.

It is explained how to compile and run the parallel solution. 
The code of the parallel solution compiles, terminates correctly, and creates sobel and emboss filtered images. 
It has a better time than sequential. 

The optimisations for the parallel version are presented and explained. At least one optimisation is presented.
It is explained how to compile and run the optimised version. 
The optimised version compiles, terminates correctly, and creates sobel and emboss filtered images.
The implementation works for any image sizes.

## time performance analysis
The performances are measured according to the size of the image and the number of processes. 
The theoretical speedup has been computed and results are presented
The performance of the parallel version against sequential version is visible and explained.
The performance of the optimised version against parallel version is visible and explained.
An explanation about why the parallel version is slower than sequential version is given (if applicable).
An explanation about why the optimised version is slower than parallel version is given (if applicable).

The hardware resources used for experiments have been described.
It is explained how time was measured in the code.

## discussion
The positive and negative sides of the different versions are explained.

## summary
A summary concluding the work is given.

## overall quality
Very good.

# Additional remarks
Very good work.

# Final grade
Passed.
