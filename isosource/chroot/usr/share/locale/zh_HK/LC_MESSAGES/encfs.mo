��    N      �  k   �      �     �  .   �  1   �  (   *  "   S  '   v  -   �  �   �  R   c     �     �  *   �  )   	     0	     H	  B   _	  >   �	  S   �	     5
  S   J
     �
     �
     �
     �
       /     .   M  #   |     �  <   �  )   �  )   #  /   M  .   }     �  .   �     �             #   %     I  �   ^  *   .  �   Y     �       l   %      �  ?   �  .   �  9   "  ?   \     �  *   �  %   �  8   
  $   C  '   h  *   �  *   �  @   �  '   '     O     i  '   �  '   �  5   �  !     !   )     K  \   i     �     �     �  {          +   �  �  �     �  0   �  &   �  *        -  '   K  9   s  �   �  h   ?     �     �  3   �  3        ;      Y  A   z  C   �  @         A  =   ^     �     �     �     �     �       +   (     T     k  *   �  )   �  ,   �  ,   
     7     Q  '   g     �     �     �     �     �  �   �     �  �   �     D     Y  @   v     �  0   �     �  *     9   H     �  %   �     �  4   �           -      I   0   e   @   �   1   �   "   	!     ,!     D!     c!  1   �!     �!     �!     �!  h    "     i"     x"     �"  |   �"     (#  1   =#     ;      8   9       +                      (       4          
       *       $   '   :   J             <   @          L          ,   F      I   #   .   2           0   G   7       6         %   	           -      D           B          K                   E   N   ?   !         5       &      /   A                3   )          H   1       >              "          =   C                 M         -- change password for volume   -- decodes name and prints plaintext version   -- decrypts a volume and writes results to path   -- encodes a filename and print result   -- print version number and exit   -- show information (Default command)   -- show undecodable filenames in the volume   --extpass=program	Use external program for password prompt

Example, to mount at ~/crypt with raw storage in ~/.crypt :
    encfs ~/.crypt ~/crypt

   --public		act as a typical multi-user filesystem
			(encfs must be run as root)
  (NOT supported)
  (using %i:%i:%i)
  -- Supports block sizes of %i to %i bytes  -- Supports key lengths of %i to %i bits  -- block size %i bytes  -- key length %i bits %s (root dir)
  -- displays information about the filesystem, or 
 -------------------------- WARNING --------------------------
 A really old EncFS filesystem was found. 
It is not supported in this EncFS build.
 Block Size: %i bytes Configuration finished.  The filesystem to be created has
the following properties: Creating new encrypted volume. Directory not created. EncFS Password:  Enter current Encfs password
 Enter new Encfs password
 Enter the number corresponding to your choice:  Error decoding volume key, password incorrect
 Error saving modified config file.
 Example: 
%s info ~/.crypt
 Failure generating new volume key! Please report this error. Filename encoding: "%s", version %i:%i:%i Filesystem cipher: "%s", version %i:%i:%i For more information, see the man page encfs(1) Found %i invalid file. Found %i invalid files. In directory %s: 
 Incorrect number of arguments for command "%s" Invalid password
 Invalid selection. Key Size: %i bits Manual configuration mode selected. New Encfs Password:  Now you will need to enter a password for your filesystem.
You will need to remember this password, as there is absolutely
no recovery mechanism.  However, the password can be changed
later using encfsctl.

 Passwords did not match, please try again
 Select a block size in bytes.  The cipher you have chosen
supports sizes from %i to %i bytes in increments of %i.
Or just hit enter for the default (%i bytes)
 Selected algorithm "%s" Selected key size:  Sorry, unable to locate cipher for predefined configuration...
Falling through to Manual configuration mode. Standard configuration selected. The directory "%s" does not exist. Should it be created? (y,N)  The following cipher algorithms are available: The following filename encoding algorithms are available: The raw directory may not be a subdirectory of the mount point. Unable to create directory:  Unable to find cipher %s, version %i:%i:%i Unable to find specified cipher "%s"
 Unable to initialize encrypted filesystem - check path.
 Unable to load or parse config file
 Unable to locate mount point, aborting. Unable to locate root directory, aborting. Unmounting filesystem %s due to inactivity Usage: %s [options] rootDir mountPoint [-- [FUSE Mount Options]] Using filesystem block size of %i bytes Using key size of %i bits Verify Encfs Password:  Version 3 configuration; created by %s
 Version 4 configuration; created by %s
 Version 5 configuration; created by %s (revision %i)
 Volume Key successfully updated.
 Zero length password not allowed
 directory %s does not exist.
 encfs [options] rootDir mountPoint -- [FUSE Mount Options]
valid FUSE Mount Options follow:
 encfs version %s encfsctl version %s filesystem block size:  fuse failed.  Common problems:
 - fuse kernel module not installed (modprobe fuse)
 - invalid options -- see usage message
 invalid command: "%s" option '--public' ignored for non-root user Project-Id-Version: encfs
Report-Msgid-Bugs-To: https://translations.launchpad.net/encfs/main/+pots/encfs
PO-Revision-Date: 2007-05-22 06:48+0000
Last-Translator: flying_cat <Unknown>
Language-Team: Chinese (Hong Kong) <zh_HK@li.org>
Language: zh_HK
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=1; plural=0;
X-Launchpad-Export-Date: 2015-03-14 00:04+0000
X-Generator: Launchpad (build 17389)
   －－ 更改磁卷密碼   －－ 解密名稱並以純文字顯示結果   －－將磁卷內容解密至路徑   －－ 加密檔案名稱並顯示結果   －－顯示版本及離開   －－ 顯示資訊（預設指令）   －－ 顯示此磁卷中不能被解密之檔案名稱   --extpass=program	使用外部程式輪入密碼

例子： 以 ~/.crypt 作為加密檔系統並掛載在 ~/crypt
    encfs ~/.crypt ~/crypt

   --public		使所有使用者都可以瀏覽此檔案系統
			(必須使用 root 身份執行 encfs )
  （不支援）
  （使用 %i:%i:%i ）
  －－支援長度為 %i 至 %i 位元組之區塊  －－支援長度為 %i 至 %i 位元之加密匙  －－區塊長 %i 位元組  －－加密匙長 %i 位元組 %s （根路徑）
  －－顯示加密檔案系統資訊，或 
 ----------------------------- 警告 -----------------------------
 發現過時之EncFS檔案系統 
而此EncFS版本並不支援
 區塊長度： %i 位元組 設定完成。此加密檔案系統
擁有以下的特性： 正在新增加密磁卷 沒有新增目錄 EncFS 密碼：  請輸入Encfs之現有密碼
 請輸入Encfs之新密碼
 請輸入選擇：  磁卷加密匙解密失敗，密碼錯誤
 設定檔儲存失敗
 例子： 
%s info ~/.crypt
 加密匙產生失敗！請回報此問題 檔案名稱加密："%s" 版本 %i:%i:%i 檔案系統加密法："%s" 版本 %i:%i:%i 看man page encfs(1)以得到更多資料。 找到 %i 個無效檔案 在目錄 %s 內： 
 指令 "%s" 中之參數數目不正確 密碼錯誤
 輸入錯誤 加密匙長度：%i 位元 已選用人手設定模式 新 Encfs 密碼：  請為此加密檔案系統輸入密碼
不要遺失此密碼，因為程式沒
有密碼復元功能。
以後可以使用encfsctl更改密碼。

 驗證失敗，請重新輸入
 選擇區塊長度。已選之加密法
支援 %i 至 %i 位元組長度，以 %i 位元組為一單位
或按 Enter 以使用預設值( %i 位元組)
 選擇加密法 "%s" 已選之加密匙長度：  預設之加密法並不存在...
改為使用人手設定模式 已選用標準模式 目錄 "%s" 並不存在，是否新增？(y,N)  可使用之加密法如下： 可使用之檔案名稱加密法如下： 加密檔案系統之目錄不能為掛載點之子目錄 新增目錄失敗：  找不到加密法 %s 版本 %i:%i:%i 找不到加密法 "%s"
 加密檔案系統初始化失敗－請檢查路徑
 設定檔存取或設定錯誤
 找不到掛載點，終止 找不到根目錄，終止 掛載靜止，解除掛載加密檔案系統 %s 使用：%s [選項] rootDir mountPoint [-- [FUSE Mount 選項]] 使用區塊長度為 %i 位元組的檔案系統 使用 %i 位元長度之加密匙 驗證 Encfs 密碼：  設定版本3；由 %s 建立
 設定版本4；由 %s 建立
 設定版本5；由 %s 建立（修訂版 %i ）
 磁卷加密匙更新成功
 不容許零長度密碼
 目錄 %s 不存在
 encfs [選項] rootDir mountPoint -- [FUSE Mount 選項]
在此以後輸入適用之FUSE Mount選項：
 encfs 本版%s encfsctl 版本 %s 檔案系統之區塊長度：  fuse 失敗，一般原因：
 － 沒有安將 fuse 核心模組 (modprobe fuse)
 － 不正確選項，請看使用訊息
 指令錯誤： "%s" 選項 '--public' 對root以外之使用者無效 