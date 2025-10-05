### I. Build CSP:

Sau khi pull CSP 1.6 về, vào thư mục `libcsp`.

- Chạy command trên terminal để cấu hình code CSP bật tính năng KISS UART(/dev/ttyUSB0 là cổng USB UART được kết nói với PC) và bật tính năng debug: `python3 waf configure --with-driver-usart=/dev/ttyUSB0 --enable-debug`.

- Build config: `python3 waf build`.

- Có thể xóa code được build bằng: `python3 waf distclean`.

- Xem cách cấu hình các tính năng khác: `python3 waf configure`.

### II. Chạy CSP:

- Tại thư mục `libcsp` chạy file `buildall.py` trong thư mục `examples`. Lúc này trong thư mục `build/include/csp` sẽ xuất hiện file `csp_autoconfig.h`. File này được dùng để thêm vào khi port lên STM32.

- Chạy `./csp_server_client -a 3 -k /dev/ttyUSB0 -r 2` để chạy chương trình và đang gán node này với địa chỉ là 3, node đích đến là 2. Task client sẽ làm nhiệm vụ gửi đi.