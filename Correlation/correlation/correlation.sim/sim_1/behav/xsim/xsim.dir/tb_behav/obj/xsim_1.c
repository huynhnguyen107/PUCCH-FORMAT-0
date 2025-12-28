/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_110(char*, char *);
extern void execute_111(char*, char *);
extern void execute_112(char*, char *);
extern void execute_113(char*, char *);
extern void execute_1043(char*, char *);
extern void execute_1044(char*, char *);
extern void execute_1045(char*, char *);
extern void execute_1046(char*, char *);
extern void execute_1047(char*, char *);
extern void execute_1048(char*, char *);
extern void execute_109(char*, char *);
extern void execute_1042(char*, char *);
extern void vlog_const_rhs_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_487(char*, char *);
extern void execute_488(char*, char *);
extern void execute_489(char*, char *);
extern void execute_490(char*, char *);
extern void execute_491(char*, char *);
extern void execute_492(char*, char *);
extern void execute_503(char*, char *);
extern void execute_504(char*, char *);
extern void execute_505(char*, char *);
extern void execute_506(char*, char *);
extern void execute_508(char*, char *);
extern void execute_509(char*, char *);
extern void execute_510(char*, char *);
extern void execute_511(char*, char *);
extern void execute_515(char*, char *);
extern void execute_516(char*, char *);
extern void execute_524(char*, char *);
extern void execute_528(char*, char *);
extern void execute_529(char*, char *);
extern void execute_530(char*, char *);
extern void execute_531(char*, char *);
extern void execute_533(char*, char *);
extern void execute_534(char*, char *);
extern void execute_535(char*, char *);
extern void execute_536(char*, char *);
extern void execute_542(char*, char *);
extern void execute_543(char*, char *);
extern void execute_548(char*, char *);
extern void execute_554(char*, char *);
extern void execute_558(char*, char *);
extern void execute_559(char*, char *);
extern void execute_562(char*, char *);
extern void execute_563(char*, char *);
extern void execute_566(char*, char *);
extern void execute_567(char*, char *);
extern void execute_570(char*, char *);
extern void execute_571(char*, char *);
extern void execute_574(char*, char *);
extern void execute_575(char*, char *);
extern void execute_578(char*, char *);
extern void execute_579(char*, char *);
extern void execute_118(char*, char *);
extern void execute_55(char*, char *);
extern void vlog_simple_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void vlog_simple_process_execute_1_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_466(char*, char *);
extern void execute_469(char*, char *);
extern void execute_470(char*, char *);
extern void execute_471(char*, char *);
extern void execute_474(char*, char *);
extern void execute_475(char*, char *);
extern void execute_476(char*, char *);
extern void execute_477(char*, char *);
extern void execute_478(char*, char *);
extern void execute_7(char*, char *);
extern void execute_8(char*, char *);
extern void execute_9(char*, char *);
extern void execute_10(char*, char *);
extern void execute_11(char*, char *);
extern void execute_12(char*, char *);
extern void execute_13(char*, char *);
extern void execute_14(char*, char *);
extern void execute_15(char*, char *);
extern void execute_16(char*, char *);
extern void execute_17(char*, char *);
extern void execute_18(char*, char *);
extern void execute_19(char*, char *);
extern void execute_20(char*, char *);
extern void execute_21(char*, char *);
extern void execute_22(char*, char *);
extern void execute_52(char*, char *);
extern void execute_53(char*, char *);
extern void execute_54(char*, char *);
extern void execute_350(char*, char *);
extern void execute_351(char*, char *);
extern void execute_354(char*, char *);
extern void execute_416(char*, char *);
extern void execute_417(char*, char *);
extern void execute_418(char*, char *);
extern void execute_421(char*, char *);
extern void execute_425(char*, char *);
extern void execute_438(char*, char *);
extern void execute_439(char*, char *);
extern void execute_440(char*, char *);
extern void execute_450(char*, char *);
extern void execute_451(char*, char *);
extern void execute_452(char*, char *);
extern void execute_453(char*, char *);
extern void execute_454(char*, char *);
extern void execute_455(char*, char *);
extern void execute_456(char*, char *);
extern void execute_457(char*, char *);
extern void execute_458(char*, char *);
extern void execute_459(char*, char *);
extern void execute_460(char*, char *);
extern void execute_461(char*, char *);
extern void execute_462(char*, char *);
extern void execute_463(char*, char *);
extern void execute_27(char*, char *);
extern void execute_28(char*, char *);
extern void execute_29(char*, char *);
extern void execute_30(char*, char *);
extern void execute_31(char*, char *);
extern void execute_32(char*, char *);
extern void execute_38(char*, char *);
extern void execute_39(char*, char *);
extern void execute_43(char*, char *);
extern void execute_44(char*, char *);
extern void execute_45(char*, char *);
extern void execute_46(char*, char *);
extern void execute_47(char*, char *);
extern void execute_48(char*, char *);
extern void execute_49(char*, char *);
extern void execute_50(char*, char *);
extern void execute_355(char*, char *);
extern void execute_356(char*, char *);
extern void execute_357(char*, char *);
extern void execute_358(char*, char *);
extern void execute_360(char*, char *);
extern void execute_361(char*, char *);
extern void execute_364(char*, char *);
extern void execute_367(char*, char *);
extern void execute_368(char*, char *);
extern void execute_369(char*, char *);
extern void execute_370(char*, char *);
extern void execute_371(char*, char *);
extern void execute_374(char*, char *);
extern void execute_375(char*, char *);
extern void execute_376(char*, char *);
extern void execute_377(char*, char *);
extern void execute_378(char*, char *);
extern void execute_379(char*, char *);
extern void execute_380(char*, char *);
extern void execute_381(char*, char *);
extern void execute_382(char*, char *);
extern void execute_383(char*, char *);
extern void execute_384(char*, char *);
extern void execute_385(char*, char *);
extern void execute_386(char*, char *);
extern void execute_387(char*, char *);
extern void execute_388(char*, char *);
extern void execute_389(char*, char *);
extern void execute_390(char*, char *);
extern void execute_391(char*, char *);
extern void execute_392(char*, char *);
extern void execute_393(char*, char *);
extern void execute_394(char*, char *);
extern void execute_395(char*, char *);
extern void execute_396(char*, char *);
extern void execute_397(char*, char *);
extern void execute_398(char*, char *);
extern void execute_399(char*, char *);
extern void execute_400(char*, char *);
extern void execute_401(char*, char *);
extern void execute_402(char*, char *);
extern void execute_403(char*, char *);
extern void execute_404(char*, char *);
extern void execute_405(char*, char *);
extern void execute_406(char*, char *);
extern void execute_949(char*, char *);
extern void execute_950(char*, char *);
extern void execute_951(char*, char *);
extern void execute_952(char*, char *);
extern void execute_953(char*, char *);
extern void execute_954(char*, char *);
extern void execute_965(char*, char *);
extern void execute_966(char*, char *);
extern void execute_967(char*, char *);
extern void execute_968(char*, char *);
extern void execute_970(char*, char *);
extern void execute_971(char*, char *);
extern void execute_972(char*, char *);
extern void execute_973(char*, char *);
extern void execute_977(char*, char *);
extern void execute_978(char*, char *);
extern void execute_986(char*, char *);
extern void execute_990(char*, char *);
extern void execute_991(char*, char *);
extern void execute_992(char*, char *);
extern void execute_993(char*, char *);
extern void execute_995(char*, char *);
extern void execute_996(char*, char *);
extern void execute_997(char*, char *);
extern void execute_998(char*, char *);
extern void execute_1004(char*, char *);
extern void execute_1005(char*, char *);
extern void execute_1010(char*, char *);
extern void execute_1016(char*, char *);
extern void execute_1020(char*, char *);
extern void execute_1021(char*, char *);
extern void execute_1024(char*, char *);
extern void execute_1025(char*, char *);
extern void execute_1028(char*, char *);
extern void execute_1029(char*, char *);
extern void execute_1032(char*, char *);
extern void execute_1033(char*, char *);
extern void execute_1036(char*, char *);
extern void execute_1037(char*, char *);
extern void execute_1040(char*, char *);
extern void execute_1041(char*, char *);
extern void execute_115(char*, char *);
extern void execute_116(char*, char *);
extern void execute_117(char*, char *);
extern void execute_1049(char*, char *);
extern void execute_1050(char*, char *);
extern void execute_1051(char*, char *);
extern void execute_1052(char*, char *);
extern void execute_1053(char*, char *);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[222] = {(funcp)execute_110, (funcp)execute_111, (funcp)execute_112, (funcp)execute_113, (funcp)execute_1043, (funcp)execute_1044, (funcp)execute_1045, (funcp)execute_1046, (funcp)execute_1047, (funcp)execute_1048, (funcp)execute_109, (funcp)execute_1042, (funcp)vlog_const_rhs_process_execute_0_fast_no_reg_no_agg, (funcp)execute_487, (funcp)execute_488, (funcp)execute_489, (funcp)execute_490, (funcp)execute_491, (funcp)execute_492, (funcp)execute_503, (funcp)execute_504, (funcp)execute_505, (funcp)execute_506, (funcp)execute_508, (funcp)execute_509, (funcp)execute_510, (funcp)execute_511, (funcp)execute_515, (funcp)execute_516, (funcp)execute_524, (funcp)execute_528, (funcp)execute_529, (funcp)execute_530, (funcp)execute_531, (funcp)execute_533, (funcp)execute_534, (funcp)execute_535, (funcp)execute_536, (funcp)execute_542, (funcp)execute_543, (funcp)execute_548, (funcp)execute_554, (funcp)execute_558, (funcp)execute_559, (funcp)execute_562, (funcp)execute_563, (funcp)execute_566, (funcp)execute_567, (funcp)execute_570, (funcp)execute_571, (funcp)execute_574, (funcp)execute_575, (funcp)execute_578, (funcp)execute_579, (funcp)execute_118, (funcp)execute_55, (funcp)vlog_simple_process_execute_0_fast_no_reg_no_agg, (funcp)vlog_simple_process_execute_1_fast_no_reg_no_agg, (funcp)execute_466, (funcp)execute_469, (funcp)execute_470, (funcp)execute_471, (funcp)execute_474, (funcp)execute_475, (funcp)execute_476, (funcp)execute_477, (funcp)execute_478, (funcp)execute_7, (funcp)execute_8, (funcp)execute_9, (funcp)execute_10, (funcp)execute_11, (funcp)execute_12, (funcp)execute_13, (funcp)execute_14, (funcp)execute_15, (funcp)execute_16, (funcp)execute_17, (funcp)execute_18, (funcp)execute_19, (funcp)execute_20, (funcp)execute_21, (funcp)execute_22, (funcp)execute_52, (funcp)execute_53, (funcp)execute_54, (funcp)execute_350, (funcp)execute_351, (funcp)execute_354, (funcp)execute_416, (funcp)execute_417, (funcp)execute_418, (funcp)execute_421, (funcp)execute_425, (funcp)execute_438, (funcp)execute_439, (funcp)execute_440, (funcp)execute_450, (funcp)execute_451, (funcp)execute_452, (funcp)execute_453, (funcp)execute_454, (funcp)execute_455, (funcp)execute_456, (funcp)execute_457, (funcp)execute_458, (funcp)execute_459, (funcp)execute_460, (funcp)execute_461, (funcp)execute_462, (funcp)execute_463, (funcp)execute_27, (funcp)execute_28, (funcp)execute_29, (funcp)execute_30, (funcp)execute_31, (funcp)execute_32, (funcp)execute_38, (funcp)execute_39, (funcp)execute_43, (funcp)execute_44, (funcp)execute_45, (funcp)execute_46, (funcp)execute_47, (funcp)execute_48, (funcp)execute_49, (funcp)execute_50, (funcp)execute_355, (funcp)execute_356, (funcp)execute_357, (funcp)execute_358, (funcp)execute_360, (funcp)execute_361, (funcp)execute_364, (funcp)execute_367, (funcp)execute_368, (funcp)execute_369, (funcp)execute_370, (funcp)execute_371, (funcp)execute_374, (funcp)execute_375, (funcp)execute_376, (funcp)execute_377, (funcp)execute_378, (funcp)execute_379, (funcp)execute_380, (funcp)execute_381, (funcp)execute_382, (funcp)execute_383, (funcp)execute_384, (funcp)execute_385, (funcp)execute_386, (funcp)execute_387, (funcp)execute_388, (funcp)execute_389, (funcp)execute_390, (funcp)execute_391, (funcp)execute_392, (funcp)execute_393, (funcp)execute_394, (funcp)execute_395, (funcp)execute_396, (funcp)execute_397, (funcp)execute_398, (funcp)execute_399, (funcp)execute_400, (funcp)execute_401, (funcp)execute_402, (funcp)execute_403, (funcp)execute_404, (funcp)execute_405, (funcp)execute_406, (funcp)execute_949, (funcp)execute_950, (funcp)execute_951, (funcp)execute_952, (funcp)execute_953, (funcp)execute_954, (funcp)execute_965, (funcp)execute_966, (funcp)execute_967, (funcp)execute_968, (funcp)execute_970, (funcp)execute_971, (funcp)execute_972, (funcp)execute_973, (funcp)execute_977, (funcp)execute_978, (funcp)execute_986, (funcp)execute_990, (funcp)execute_991, (funcp)execute_992, (funcp)execute_993, (funcp)execute_995, (funcp)execute_996, (funcp)execute_997, (funcp)execute_998, (funcp)execute_1004, (funcp)execute_1005, (funcp)execute_1010, (funcp)execute_1016, (funcp)execute_1020, (funcp)execute_1021, (funcp)execute_1024, (funcp)execute_1025, (funcp)execute_1028, (funcp)execute_1029, (funcp)execute_1032, (funcp)execute_1033, (funcp)execute_1036, (funcp)execute_1037, (funcp)execute_1040, (funcp)execute_1041, (funcp)execute_115, (funcp)execute_116, (funcp)execute_117, (funcp)execute_1049, (funcp)execute_1050, (funcp)execute_1051, (funcp)execute_1052, (funcp)execute_1053, (funcp)vlog_transfunc_eventcallback};
const int NumRelocateId= 222;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/tb_behav/xsim.reloc",  (void **)funcTab, 222);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/tb_behav/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void wrapper_func_0(char *dp)

{

}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/tb_behav/xsim.reloc");
	wrapper_func_0(dp);

	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstantiate();

extern void implicit_HDL_SCcleanup();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/tb_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/tb_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/tb_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
