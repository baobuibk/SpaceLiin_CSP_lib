

#include <csp/interfaces/csp_if_lo.h>
#include <csp/arch/csp_time.h>
#include <csp/csp_id.h>
#include <csp_autoconfig.h>
#include "csp_conn.h"
#include "csp_qfifo.h"
#include "csp_port.h"
#include "csp_rdp_queue.h"

csp_conf_t csp_conf = {
	.version = 2,
	.address = 255,
	.hostname = "stm32-node",
	.model = "stm32f4",
	.revision = "1.0",
	.conn_dfl_so = CSP_O_NONE,
	.dedup = CSP_DEDUP_OFF};

uint16_t csp_get_address(void) {
	return csp_conf.address;
}

void csp_init(void) {

	csp_buffer_init(); // cấp bộ nhớ nội cho CSP (packet buffer)
	csp_conn_init(); // khởi tạo hệ thống quản lí kết nối
	csp_qfifo_init(); // Khởi tạo FIFO queue cho các packet chờ xử lý.
#if (CSP_USE_RDP)
	csp_rdp_queue_init(); //Khởi tạo queue cho RDP protocol 
#endif

//	/* Loopback */
//	csp_if_lo.netmask = csp_id_get_host_bits(); //thiết lập netmask, giống với subnet mask của IP
//	csp_iflist_add(&csp_if_lo); // Thêm interface (giao diện loopback) vào danh sách các giao diện của hệ thống CSP.
//								// (giao diện loopback) vào danh sách các giao diện của hệ thống CSP.
//
//	/* Register loopback route */
//	csp_rtable_set(0, 14, &csp_if_lo, CSP_NO_VIA_ADDRESS); // thiết lập routing table (bảng định tuyến) cho node.
}

void csp_free_resources(void) {

	csp_rtable_free();
}

const csp_conf_t * csp_get_conf(void) {
	return &csp_conf;
}
