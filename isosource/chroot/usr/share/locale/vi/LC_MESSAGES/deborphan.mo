��    E      D  a   l      �  4   �  &   &     M  �   j  $   �  O     "   i      �  #   �  C   �  4       J	  4   b	  =   �	  A   �	  2   
  ;   J
  9   �
  ?   �
  @      B   A  :   �  A   �  :     :   <  6   w  :   �  :   �  <   $  :   a  G   �  P   �  D   5  2   z     �     �  5   �  +     ,   K  4   x  /   �  9   �  :     "   R     u  :   �  :   �  9     7   ;  1   s     �  1   �  !   �       {   9     �     �     �        ,     =   9  .   w  J   �     �  *   �  �   %  9   �  !     x  (  7   �  0   �  (   
  �   3  $     ^   ,  /   �     �  #   �  R   �  N  Q  #   �  E   �  L   
  M   W  N   �  R   �  M   G  S   �  O   �  M   9  N   �  V   �  J   -  M   x  L   �  M     M   a  O   �  M   �  V   M   {   �   S    !  ;   t!  /   �!  9   �!  G   "  K   b"  6   �"  D   �"  @   *#  M   k#  �   �#  E   :$      �$  �   �$  I   /%  I   y%  R   �%  ;   &  '   R&  {   z&  ,   �&  +   #'  �   O'  !   �'  4   (      F(     g(  7   z(  X   �(  B   )  L   N)     �)  ?   �)  �   �)  E   �*  .   +        %       5              '       ,       !      =                     3         E          )             /              0       8   *   &   D             ?            -             6   C      2      (       ;   .          #       1       
           >       A   4   <                 "      	   B   $   :                     9       7       @         +    
See also: deborphan(1), orphaner(8)
Report bugs to: 
The following options are available:
 "apt" got removed.  Exiting. "apt" is not installed, broken dependencies found or could not open lock file, are you root?  Printing "apt-get" commandline and exiting: "apt-get" returned with exitcode %s. "apt-get" tries to remove more packages than requested by "orphaner".  Exiting. "deborphan" got removed.  Exiting. "deborphan" returned with error. "dialog" returned with exitcode %s. "find-circular" is currently not supported by "orphaner".  Exiting. %s %s - Find packages without other packages depending on them
Distributed under the terms of the Artistic License.

THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR
IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
 %s: Invalid option: %s. %s: You need "dialog" in $PATH to run this frontend. --df-keep                   Read debfoster's "keepers" file.
 --find-config               Find "orphaned" configuration files.
 --guess-all                 Try all of the above.
 --guess-common              Try to report common packages.
 --guess-data                Try to report data packages.
 --guess-debug               Try to report debugging libraries.
 --guess-dev                 Try to report development packages.
 --guess-doc                 Try to report documentation packages.
 --guess-dummy               Try to report dummy packages.
 --guess-interpreters        Try to report interpreter libraries.
 --guess-kernel              Try to report kernel modules.
 --guess-mono                Try to report mono libraries.
 --guess-only                Use --guess options only.
 --guess-perl                Try to report perl libraries.
 --guess-pike                Try to report pike libraries.
 --guess-python              Try to report python libraries.
 --guess-ruby                Try to report ruby libraries.
 --guess-section             Try to report libraries in wrong sections.
 --libdevel                  Search in libdevel in addition to libs and oldlibs.
 --no-df-keep                Do not read debfoster's "keepers" file.
 --no-show-section           Do not show sections.
 -A PKGS.. Never report PKGS.
 -H        Ignore hold flags.
 -L        List the packages that are never reported.
 -P        Show priority of packages found.
 -R PKGS.. Remove PKGS from the "keep" file.
 -Z        Remove all packages from the "keep" file.
 -a        Compare all packages, not just libs.
 -d        Show dependencies for packages that have them.
 -e LIST   Work as if packages in LIST were not installed.
 -f FILE   Use FILE as statusfile.
 -h        This help.
 -k FILE   Use FILE to get/store info about kept packages.
 -n        Disable checks for `recommends' and `suggests'.
 -n        Enable checks for `recommends' and `suggests'.
 -p PRIOR  Select only packages with priority >= PRIOR.
 -s        Show the sections the packages are in.
 -v        Version information.
 -z        Show installed size of packages found.
 Disable checks for `recommends'.
 Disable checks for `suggests'.
 Explicitly specified status file or requested calling "apt-get" to be skipped.  Printing "apt-get" commandline and exiting: Invalid basename: %s. No orphaned packages found. Press enter to continue. Removing %s Screen too small or set $LINES and $COLUMNS. See orphaner(8) and deborphan(1) for a list of valid options. Select packages for removal or cancel to quit: Select packages that should never be recommended for removal in deborphan: Simulate Status file is probably invalid. Exiting.
 The status file is in an improper state.
One or more packages are marked as half-installed, half-configured,
unpacked, triggers-awaited or triggers-pending. Exiting.
 Usage: %s [--help|--purge|--skip-apt] [deborphan options] Usage: %s [OPTIONS] [PACKAGE]...
 Project-Id-Version: deborphan 1.7.28.5
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2012-06-30 18:50+0000
PO-Revision-Date: 2011-01-25 21:28+0700
Last-Translator: Lê Hoàng Phương <herophuong93@gmail.com>
Language-Team: Vietnamese <debian-l10n-vietnamese@lists.debian.org>
Language: vi
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
 
Xem cả: deborphan(1), orphaner(8)
Gửi lỗi tới: 
Những tùy chọn sau có thể sử dụng:
 "apt" đã bị xóa bỏ. Đang thoát. "apt" chưa được cài đặt, các phụ thuộc bị hỏng được tìm ra hoặc không thể mở tập tin khóa, bạn có phải là root không? Đang hiển thị dòng lệnh "apt-get" và thoát: "apt-get" trả lại mã thoát %s. "apt-get" cố gắng loại bỏ nhiều gói hơn yêu cầu từ "orphaner".  Đang thoát. "deborphan" đã bị xóa bỏ.  Đang thoát. "deborphan" trả lại lỗi. "dialog" trả lại mã thoát %s. "find-circular" hiện không được hỗ trợ bởi "orphaner".  Đang thoát. %s %s - Tìm các gói mà không có gói khác phụ thuộc vào
Phân phối dưới những điều khoản của Giấy phép Artistic.

THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR
IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
 %s: Tùy chọn vô giá trị: %s. %s: Bạn cần "dialog" trong $PATH để chạy trình đầu này. --df-keep                       Đọc tập tin "keepers" của debfoster.
 --find-config                   Tìm các tập tin cấu hình "mồ côi".
 --guess-all                     Cố gắng tất cả những điều trên.
 --guess-common                  Cố gắng báo cáo các gói thông thường.
 --guess-data                    Cố gắng báo cáo các gói dữ liệu.
 --guess-debug                   Cố gắng báo cáo các thư viện gỡ lỗi.
 --guess-dev                     Cố gắng báo cáo các gói phát triển.
 --guess-doc                     Cố gắng báo cáo các gói tài liệu.
 --guess-dummy                   Cố gắng báo cáo các gói giả dạng.
 --guess-interpreters            Cố gắng báo cáo các thư viện phiên dịch.
 --guess-kernel                  Cố gắng báo cáo các mô-đun lõi.
 --guess-mono                    Cố gắng báo cáo các thư viện mono.
 --guess-only                    Chỉ sử dụng các tùy chọn --guess.
 --guess-perl                    Cố gắng báo cáo các thư viện perl.
 --guess-pike                    Cố gắng báo cáo các thư viện pike.
 --guess-python                  Cố gắng báo cáo các thư viện python.
 --guess-ruby                    Cố gắng báo cáo các thư viện ruby.
 --guess-section                 Cố gắng báo cáo các thư viện ở sai mục.
 --libdevel                      Tìm trong libdevel để thêm vào cho libs và
                                oldlibs.
 --no-df-keep                    Không đọc tập tin "keepers" của debfoster.
 --no-show-section               Không hiển thị mục.
 -A PKGS..     Không bao giờ báo cáo PKGS.
 -H            Bỏ qua những cờ đã được giữ.
 -L            Liệt kê các gói chưa bao giờ được báo cáo.
 -P            Hiện độ ưu tiên của các gói được tìm thấy.
 -R PKGS..     Xóa bỏ PKGS khỏi tập tin "keep".
 -Z            Xóa bỏ tất cả các gói từ tập tin "keep".
 -a            So sánh tất cả các gói, không chỉ libs.
 -d            Hiển thị các phụ thuộc của gói bị phụ thuộc.
 -e DANH_SÁCH  Hoạt động nếu như các gói trong DANH_SÁCH
                                chưa được cài đặt.
 -f TẬP_TIN    Sử dụng  TẬP_TIN như tập tin trạng thái.
 -h            Giúp đỡ này.
 -k TẬP_TIN    Sử dụng TẬP_TIN để lấy/lưu trữ thông tin về
                                các gói được giữ lại.
 -n            Tắt kiểm tra với `khuyến cáo' và `đề nghị'.
 -n            Bật kiểm tra với `khuyến cáo' và `đề nghị'.
 -p ĐỘ_ƯU_TIÊN Chỉ chọn các gói có độ ưu tiên >= ĐỘ_ƯU_TIÊN.
 -s            Hiện các mục có các gói nằm trong.
 -v            Thông tin phiên bản.
 -z            Hiện kích thước đã cài đặt của các gói được tìm
                                thấy.
     Tắt kiểm tra với "khuyến cáo".
     Tắt kiểm tra với 'đề nghị'.
 Rõ ràng tập tin trạng thái được chỉ định hoặc yêu cầu gọi "apt-get" bị bỏ qua. Đang hiển thị dòng lệnh "apt-get" và thoát: Tên cơ sở vô giá trị: %s. Không có gói mồ côi nào được tìm thấy. Nhấn enter để tiếp tục. Đang xóa bỏ %s Màn hình quá nhỏ để đặt $LINES và $COLUMNS. Xem orphaner(8) và deborphan(1) để lấy danh sách các tùy chọn có giá trị. Chọn các gói để loại bỏ hoặc hủy bỏ để thoát: Chọn các gói không nên bị khuyến cáo loại bỏ trong deborphan: Mô phỏng Tập tin trạng thái có thể vô giá trị. Đang thoát
 Tập tin trạng thái đang ở tình trạng không chính xác.
Một hoặc nhiều gói được đánh dấu là đã-cài-đặt-nửa, đã-cấu-hình-nửa,
đã mở, triggers-awaited hoặc triggers-pending. Đang thoát.
 Cách sử dụng: %s [--help|--purge|--skip-apt] [deborphan options] Cách sử dụng: %s [TÙY_CHỌN] [GÓI]...
 