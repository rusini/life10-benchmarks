# Benchmarks #

NB: Minimum run times out of a series of measurements are reported.


Testbed A
--------------------------------------------------------------------------------------------------------------

_CPU_:     Intel Xeon L5640 @2.26 GHz (2.80 GHz) &mdash; Westmere-EP  
_Kernel_:  2.6.32-042stab126.1 (CentOS 6 + OpenVZ)  
_Distro_:  CentOS release 6.9 (Final) + vzkernel-2.6.32-042stab126.1 + CentOS release 6.10 (Final)

Language + variant (translator)	| Time (s) |  G    | Slowdown	| Translator + backend version-release
-------------------------------	| --------:| -----:| --------:	| --------------------------------------------
C++ (g++)			|   1.037  | 66000 |  **1.000**	| 8.3.1-3.2.el6
C++ (clang++)			|   1.021  | 66000 |    0.985	| 3.4.2-4.el6 + 4.9.2-6.2.el6 (g++)
Python 2			|   3.204  |  1000 |  203.919	| 2.6.6-68.el6_10
Python 3			|   5.203  |  1000 |  331.146	| 3.4.10-4.el6
PHP				|   3.560  |  1000 |  226.577	| 5.3.3-50.el6_10
Perl				|   5.640  |  1000 |  358.959	| 5.10.1-144.el6
Ruby				|  14.122  |  1000 |  898.797	| 1.8.7.374-5.el6
JavaScript/ECMAScript		|   5.887  | 66000 |    5.677	| 0.10.48-3.el6 (node)
Tcl				|   6.724  |   100 | 4279.499	| 8.5.7-6.el6
Lua (lua)			| 141.703  | 66000 |  136.647	| 5.1.4-4.1.el6
Lua (luajit)			|   4.319  | 66000 |    4.165	| 2.0.4-3.el6
Scheme (guile)			|   6.176  |  1000 |  393.072	| 1.8.7-5.el6
Scheme (csc)			|   0.671  |  1000 |   42.706	| 4.12.0-3.el6 + 8.3.1-3.2.el6 (gcc)
MANOOL + AllocOpt=True		|   2.502  |  1000 |  159.240	| 0.5.0 (built with g++ 8.3.1-3.2.el6)
MANOOL + AllocOpt=False		|   2.593  |  1000 |  165.032	| 0.5.0 (ditto)


Testbed B
--------------------------------------------------------------------------------------------------------------

_CPU_:     Intel Celeron N3060 @1.60 GHz (2.48 GHz) &mdash; Braswell  
_Kernel_:  4.4.0-17134-Microsoft (Windows 10 + WSL)  
_Distro_:  Windows 10 Home version 1803 build 17134.1130 + Ubuntu 18.04.4 LTS

Language + variant (translator)	| Time (s) |  G    | Slowdown	| Translator + backend version-release
-------------------------------	| --------:| -----:| --------:	| --------------------------------------------
C++ (g++)			|   1.946  | 66000 |  **1.000**	| 7.5.0-3ubuntu1~18.04
C++ (clang++)			|   2.217  | 66000 |    1.139	| 1:6.0-1ubuntu2 + 7.5.0-3ubuntu1~18.04 (g++)
Python 2			|   3.733  |  1000 |  126.607	| 2.7.17-1~18.04ubuntu1
Python 3			|   5.309  |  1000 |  180.059	| 3.6.7-1~18.04
PHP				|   2.852  |  1000 |   96.728	| 7.2.24-0ubuntu0.18.04.6
Perl				|   6.768  |  1000 |  229.542	| 5.26.1-6ubuntu0.3
Ruby				|   4.425  |  1000 |  150.077	| 2.5.1-1ubuntu1.6
JavaScript/ECMAScript		|   8.522  | 66000 |    4.379	| 8.10.0~dfsg-2ubuntu0.4 (node)
Tcl				|  10.571  |   100 | 3585.231	| 8.6.8+dfsg-3
Lua (lua)			| 153.583  | 66000 |   78.922	| 5.3.3-1ubuntu0.18.04.1
Lua (luajit)			|   6.274  | 66000 |    3.224	| 2.1.0~beta3+dfsg-5.1
Scheme (guile)			|   1.233  |  1000 |   41.818	| 2.2.3+1-3ubuntu0.1
Scheme (csc)			|   1.691  |  1000 |   57.351	| 4.12.0-0.3 + 7.5.0-3ubuntu1~18.04 (gcc)
MANOOL + AllocOpt=True		|   3.882  |  1000 |  131.661	| 0.5.0 (built with g++ 7.5.0-3ubuntu1~18.04)
MANOOL + AllocOpt=False		|   3.943  |  1000 |  133.730	| 0.5.0 (ditto)

