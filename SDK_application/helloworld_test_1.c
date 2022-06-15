#include "xparameters.h"
#include "xil_io.h"
#include "xbasic_types.h"



int main(){




	u32 register_a, register_b;
	xil_printf("MP TEST CASE - 1\n\n");



	Xil_Out32(XPAR_MYIPMP_IP_0_S00_AXI_BASEADDR, 0x00000000);


	//XPAR_MYIPMP_IP_0_S00_AXI_BASEADDR

	register_a = Xil_In32( XPAR_MYIPMP_IP_0_S00_AXI_BASEADDR);
	register_b = Xil_In32( XPAR_MYIPMP_IP_0_S00_AXI_BASEADDR+4);



	xil_printf("register_a = %d\t, register_b = %d\t\n", register_a, register_b);
	return 0;



}
