/*
 * csp_user_config.h
 *
 *  Created on: Sep 18, 2025
 *      Author: hoang
 */

#ifndef CSP_AUTOCONFIG_H_
#define CSP_AUTOCONFIG_H_

///* WARNING! All changes made to this file will be lost! */
//
//#ifndef W_INCLUDE_CSP_CSP_AUTOCONFIG_H_WAF
//#define W_INCLUDE_CSP_CSP_AUTOCONFIG_H_WAF
//
//#define GIT_REV "1.6.4-0-g9391fc1"
#define CSP_FREERTOS 1
///* #undef CSP_POSIX */
///* #undef CSP_WINDOWS */
///* #undef CSP_MACOSX */
#define CSP_DEBUG 1
//#define CSP_DEBUG_TIMESTAMP 0
//#define CSP_USE_RDP 0
//#define CSP_USE_RDP_FAST_CLOSE 0
//#define CSP_USE_CRC32 0
//#define CSP_USE_HMAC 0
//#define CSP_USE_XTEA 0
//#define CSP_USE_PROMISC 1
//#define CSP_USE_QOS 0
//#define CSP_USE_DEDUP 0
//#define CSP_USE_EXTERNAL_DEBUG 0
//#define CSP_LOG_LEVEL_DEBUG 1
//#define CSP_LOG_LEVEL_INFO 1
//#define CSP_LOG_LEVEL_WARN 1
//#define CSP_LOG_LEVEL_ERROR 1
//#define CSP_LITTLE_ENDIAN 1
///* #undef CSP_BIG_ENDIAN */
//#define LIBCSP_VERSION "1.6"
//
//#endif /* W_INCLUDE_CSP_CSP_AUTOCONFIG_H_WAF */

/***************************USER CONFIG CSP*******************************/


#define CSP_CONN_RXQUEUE_LEN 10 // Độ dài hàng đợi nhận kết nối
//#define CSP_BASE_TYPE void      // Kiểu cơ bản cho CSP (dùng void cho STM32)

/*************/
/* Endianness cho STM32 (little-endian) */
#define CSP_LITTLE_ENDIAN 1

/* Buffer configuration */
#define CSP_BUFFER_SIZE 256     /* Kích thước mỗi buffer (byte) */
#define CSP_BUFFER_COUNT 20     /* Số lượng buffer, tương ứng với CSP_BUFFER_COUNT trong csp_buffer.c */

/* Queue and FIFO */
#define CSP_QFIFO_LEN 10  /* Số lượng queue FIFO, thêm từ lỗi csp_qfifo.c */

/* RDP configuration */
#define CSP_RDP_MAX_WINDOW 10  /* Window size cho RDP, thêm từ lỗi csp_rdp_queue.c */

/* Connection configuration */
#define CSP_CONN_MAX 8          /* Số lượng kết nối tối đa */
#define CSP_PORT_MAX_BIND 63    /* Số port tối đa có thể bind, tương ứng với CSP_PORT_MAX_BIND trong csp_conn.c */

#define CSP_CONN_RXQUEUE_LEN 10 /* Độ dài queue nhận cho mỗi kết nối */

/* Route table */
#define CSP_RTABLE_SIZE 10  /* Thêm từ lỗi csp_rtable_cidr.c, số lượng route tối đa */

/* CAN support */
#define CSP_HAVE_CAN 1
#define CSP_ENABLE_CSP_IF_CAN 1

/* Logging */
#define CSP_LOG_LEVEL_INFO 		1
#define CSP_LOG_LEVEL_WARN 		1
#define CSP_LOG_LEVEL_ERROR 	1

/* Other defaults */
#define CSP_USE_PROMISC		1
#define SKBUF_SIZE 			CSP_BUFFER_SIZE
#define CSP_ERR_NONE 		0
#define CSP_ENABLE_CSP_PRINT 1  // Bật hệ thống in ấn của CSP
#undef CSP_PRINT_STDIO         // Tắt stdio để tránh vprintf

#endif /* CSP_AUTOCONFIG_H_ */
