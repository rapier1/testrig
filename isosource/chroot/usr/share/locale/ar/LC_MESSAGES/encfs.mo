��    i      d  �   �       	  ]   	  .   _	  1   �	  1   �	  (   �	  "   
  -   >
  R   l
      �
     �
     �
  *     )   0     Z     r  B   �  >   �  S     P  _     �  )   �  2   �     "  U   :  S   �     �       6        Q     b     �  /   �  .   �  #   �       j   9  <   �  (   �  )   
  *   4  )   _  /   �     �  .   �  &   �     "  #   @     d     v     �  #   �  (   �  #   �  (     4   5  #   j     �  �   �      s  *   �  �   �  �   �       �        �     �  l   �      W  :   x  ?   �  �  �  :   �  .   �  9   �  0   '  9   X  K   �     �  *   �  4   &  %   [  8   �  ;   �  $   �  *        F  @   N  '   �     �     �  '   �  '     5   9  !   o  !   �     �  \   �     .     ?     S     k     |  +   �  4   �  4  �  �   (!  B   �!  Q   �!  S   H"  6   �"  1   �"  i   #  �   o#  !   �#     $     2$  =   P$  =   �$  #   �$  #   �$  Z   %  A   o%  v   �%  w  (&      �'  ?   �'  J   (  +   L(  �   x(  u   )  /   �)     �)  r   �)     J*  0   d*  0   �*  5   �*  k   �*  J   h+     �+  �   �+  ]   �,  q   �,  B   o-  W   �-  S   
.  G   ^.     �.  7   �.  &   �.     /  #   ;/  $   _/     �/      �/  *   �/  3   �/  4   "0  C   W0  ]   �0  9   �0  (   31  G  \1  6   �2  I   �2    %3  �   -4     �4  �   �4  '   �5  &   6  �   26  4   �6  G   7  J   I7  ;  �7  R   �9  <   #:  R   `:  N   �:  S   ;  g   V;      �;  V   �;  g   6<  ;   �<  R   �<  \   -=  @   �=  K   �=     >  r   ,>  D   �>  *   �>      ?  9   0?  9   j?  O   �?  4   �?  ;   )@  #   e@  �   �@     A     0A  )   MA     wA     �A  J   �A  F   �A     U   f       4   X          F   N   G       1          B       d       E         
   #          5   ;      %   ?          Z      +   6       I              h   V   D   M   _       A   a   H   e   :   0   C   '              	                      *   S             2       T          g       O       Y   ]       !          ,   (                 Q   K           )   b   W   "       c                       7   P              L      \       `       >   [   ^   i   9   =   -   @   3                                 J      $      &       /       R          .   8   <      -- change password for volume, taking password from standard input.
	No prompts are issued.   -- decodes name and prints plaintext version   -- decodes the file and cats it to standard out   -- decrypts a volume and writes results to path   -- encodes a filename and print result   -- print version number and exit   -- show undecodable filenames in the volume   --public		act as a typical multi-user filesystem
			(encfs must be run as root)
   --reverse		reverse encryption
  (NOT supported)
  (using %i:%i:%i)
  -- Supports block sizes of %i to %i bytes  -- Supports key lengths of %i to %i bits  -- block size %i bytes  -- key length %i bits %s (root dir)
  -- displays information about the filesystem, or 
 -------------------------- WARNING --------------------------
 A really old EncFS filesystem was found. 
It is not supported in this EncFS build.
 Add random bytes to each block header?
This adds a performance penalty, but ensures that blocks
have different authentication codes.  Note that you can
have the same benefits by enabling per-file initialization
vectors, which does not come with as great of performance
penalty. 
Select a number of bytes, from 0 (no random bytes) to 8:  Block Size: %i bytes Block Size: %i bytes + %i byte MAC header Block Size: %i bytes, including %i byte MAC header Build: encfs version %s Config subversion %i found, but this version of encfs only supports up to version %i. Configuration finished.  The filesystem to be created has
the following properties: Creating new encrypted volume. Directory not created. Each file contains 8 byte header with unique IV data.
 EncFS Password:  Enter current Encfs password
 Enter new Encfs password
 Enter the number corresponding to your choice:  Error decoding volume key, password incorrect
 Error saving modified config file.
 Example: 
%s info ~/.crypt
 External chained IV disabled, as both 'IV chaining'
and 'unique IV' features are required for this option. Failure generating new volume key! Please report this error. File data IV is chained to filename IV.
 Filename encoding: "%s", version %i:%i:%i Filenames encoded using IV chaining mode.
 Filesystem cipher: "%s", version %i:%i:%i For more information, see the man page encfs(1) In directory %s: 
 Incorrect number of arguments for command "%s" Internal error: failed to exec program Internal error: fork() failed Internal error: socketpair() failed Invalid password
 Invalid selection. Key Size: %i bits MAC comparison failure in block %li MAC comparison failure, refusing to read Manual configuration mode selected. Missing one or more arguments, aborting. Must set password program when using mount-on-demand Name coding interface not supported New Encfs Password:  Now you will need to enter a password for your filesystem.
You will need to remember this password, as there is absolutely
no recovery mechanism.  However, the password can be changed
later using encfsctl.

 Paranoia configuration selected. Passwords did not match, please try again
 Please choose from one of the following options:
 enter "x" for expert configuration mode,
 enter "p" for pre-configured paranoia mode,
 anything else, or an empty line will select standard mode.
?>  Please select a key size in bits.  The cipher you have chosen
supports sizes from %i to %i bits in increments of %i bits.
For example:  Remount failed Select a block size in bytes.  The cipher you have chosen
supports sizes from %i to %i bytes in increments of %i.
Or just hit enter for the default (%i bytes)
 Selected algorithm "%s" Selected key size:  Sorry, unable to locate cipher for predefined configuration...
Falling through to Manual configuration mode. Standard configuration selected. The configuration loaded is not compatible with --reverse
 The directory "%s" does not exist. Should it be created? (y,N)  The external initialization-vector chaining option has been
enabled.  This option disables the use of hard links on the
filesystem. Without hard links, some programs may not work.
The programs 'mutt' and 'procmail' are known to fail.  For
more information, please see the encfs mailing list.
If you would like to choose another configuration setting,
please press CTRL-C now to abort and start over. The filename encoding interface requested is not available The following cipher algorithms are available: The following filename encoding algorithms are available: The requested cipher interface is not available
 The requested filename coding interface is not available
 This version of EncFS doesn't support filesystems created before 2004-08-13 Unable to create directory:  Unable to find cipher %s, version %i:%i:%i Unable to find nameio interface %s, version %i:%i:%i Unable to find specified cipher "%s"
 Unable to initialize encrypted filesystem - check path.
 Unable to instanciate cipher %s, key size %i, block size %i Unable to load or parse config file
 Unable to locate root directory, aborting. Usage:
 Usage: %s [options] rootDir mountPoint [-- [FUSE Mount Options]] Using filesystem block size of %i bytes Using key size of %i bits Verify Encfs Password:  Version 3 configuration; created by %s
 Version 4 configuration; created by %s
 Version 5 configuration; created by %s (revision %i)
 Volume Key successfully updated.
 Zero length password not allowed
 directory %s does not exist.
 encfs [options] rootDir mountPoint -- [FUSE Mount Options]
valid FUSE Mount Options follow:
 encfs version %s encfsctl version %s filesystem block size:  getopt error: %i invalid command: "%s" option '--public' ignored for non-root user truncate failure: read %i bytes, partial block of %i Project-Id-Version: encfs
Report-Msgid-Bugs-To: https://translations.launchpad.net/encfs/main/+pots/encfs
PO-Revision-Date: 2008-02-27 11:55+0000
Last-Translator: Anas Husseini <anas_h_34@hotmail.com>
Language-Team: Arabic <ar@li.org>
Language: ar
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=6; plural=n==0 ? 0 : n==1 ? 1 : n==2 ? 2 : n % 100 >= 3 && n % 100 <= 10 ? 3 : n % 100 >= 11 && n % 100 <= 99 ? 4 : 5;
X-Launchpad-Export-Date: 2015-03-14 00:04+0000
X-Generator: Launchpad (build 17389)
   -- غيّر كلمة المرور للمجلد، آخذا كلمة المرور من الإدخال القياسي
	لن يظهر محث   -- تحل ترميز الاسم و تطبع  نصه الصريح   -- تحل ترميز الملف وتخرجه إلى المخرج القياسي   -- تظهّر مساحة تخزين وتكتب النتائج إلى المسار   -- ترمز اسم ملف و تطبع النتيجة   -- اطبع رقم الإصدارة و اخرج   -- أظهر أسماء الملفات المتعذر حل ترميزها في مساحة التخزين   --public		يتصرف كأنه نظام ملفات نموذجي متعدد المستخدمين
		tab](يجب تشغيل encfs كجذر)
   --reverse		تشفير عكسي
  (غير مدعوم)
  (باستخدام %i:%i:%i)
  -- يدعم حجوما للكتل من %i إلى %i بايت  -- يدعم أطوال مفاتيح من %i إلى %i بتة  -- حجم الكتلة %i بايت  -- طول المفتاح %i بتة %s (دليل الجذر) 
  -- تعرض معلومات عن نظام الملفات أو 
 -------------------------- تحذير --------------------------
 نظام ملفات EncFS هذا قديم جدا. 
و هو غير مدعوم في هذه الإنشاءة من EncFS.
 أأضيف بايتات عشوائية إلى ترويسة كل كتلة؟
يقلل هذا من الأداء إلا أنه يضمن أن يكون لكل
كتلة رمز توثيق مختلفة. لاحظ أنه بوسعك الحصول
على ذات النتيجة بتفعيل متجهات البدء على كل ملف
و هي لا تقلل الأداء بذات القدر.  حجم الكتلة: %i بايت حجم الكتلة: %i بايت + %i بايت ترويسة MAC حجم الكتلة: %i بايت متضمنة %i بايت ترويسة MAC الإنشاءة: encfs الإصدارة %s وجدت تضبيطات من الإصدارة الفرعية %i إلا أن هذه الإصدارة من encfs تدعم فقط الإصدارات حتى %i. تمت التضبيطات. نظام الملفات الذي سينشأ
ستكون له الخصائص التالية: يجري إنشاء مجلد معمى جديد. لم ينشأ الدليل. كل ملف يحوي ترويسة طولها 8 بايتات من بيانات متجه البدء الفريدة.
 كلمة مرور EncFS:  أدخل كلمة مرور EncFS الحالية
 أدخل كلمة مرور EncFS الجديدة
 أدخل الرقم المقابل لاختيارك:  حدث خطأ أثناء حل ترميز مفتاح المجلد؛ كلمة المرور غير صحيحة
 حدث خطأ أثناء حفظ ملف التضبيطات المعدّل.
 مثال: 
%s info ~/.crypt
 تم تعطيل السلسة الخارجية لمتجهات البدء حيث أن كلا من
 'سَلسة المتجهات' و 'المتجهات الفريدة' مطلوب ليتاح هذا الخيار. فشل توليد مفتاح جديد للمجلد! رجاء أبلغ عن هذا الخطأ. بيانات متجهات بدء الملفات مسلسلة مع متجهات بدء أسماء الملفات.
 ترميز أسماء اللفات: "%s" الإصدارة %i:%i:%i أيماء الملفات مرمزة في طور سَلسلة متجهات البدء.
 خوارزمية تعمية نظام الملفات: "%s" الإصدارة %i:%i:%i لمزيد من المعلومات. راجع صفحة دليل encfs(1) في الدليل %s: 
 عدد المعطيات غير صحيح للأمر "%s" Internal error: failed to exec program Internal error: fork() failed Internal error: socketpair() failed كلمة مرور غير صحيحة
 اختيار غير صحيح. طول المفتاح: %i بتة فشلت مطابقة MAC للكتلة %li فشلت مطابقة MAC، ترفض القراءة اختير طور التضبيطات اليدوية. ينقص معطى واحد أو أكثر، جارٍ الإجهاض. يحب ضبط برتامج كلمة السر عند استخدام الضم-عند-الطلب واجهة ترميز الأسماء غير مدعومة. كلمة مرور EncFS الجديدة:  ينبغي عليك الآن إدخال كلمة مرور لنظام الملفات.
سيكون عليك تذكر كلمة المرور حيث لا توجد أي
وسيلة لاستعادة المعمى، لكن سيكون بإمكانك تغيير
كلمة المرور في أي وقت لاحقا باستخدام encfsctl.

 اختيرت التضبيطات بالغة الحذر. لم تتطابق كلمتا المرور، رجاء حاول ثانية
 اختر أحد الخيارات التالية:
 أدخل "x" لطور التضبيطات المتقدم،
 اضغط "p" للتضبيطات الجاهزة بالغة الحيطة،
 أي شيء آخر أو سطر خاو سيختار الطور العادي.
؟>  اختر طولا للمفتاح بالبتات. الخوارزمية التي اخترتها
تدعم أطوالا من %i إلى %i بتة بمضاعفات %i بتة.
مثلا:  فشلت إعادة الضم اختر حجما للكتلة بالبايتات. الخوارزمية التي اخترتها
تدعم حجوما من %i إلى %i بايت بمضاعفات %i.
أو اضغط enter لتستعمل المبدئي (%i بايت)
 لقد اخترت خوارزمية "%s" طول المفتاح المختار:  تعذّر إيجاد خوارزمية تلبي الإعدادت المسبقة...
يجري الرجوع إلى طور التضبيطات اليدوية. اختيرت التضبيطات الاعتيادية الإعدادات المحملة غير متوافقة مع --reverse
 الدليل "%s" غير موجود. هل ينبغي إنشاؤه؟ (y,N)  تم تفعيل خيار السَلسلة الخاريجة لمتجهات البدء.
يعطل هذا الخيار استعمال الروابط الصلبة في نظام الملفات.
بعض البرمجيات قد لا تعمل في غياب الروابط الصلبة.
مثل، برمجيتا mutt و procmail معروف عنهما هذا.
لمزيد من المعلومات طالع قائمة encfs البريدية.
إن كنت تريد تغيير أي من خيارات التضبيطات
فاضغط CTRL-C الآن لتجهض هذا و تبدأ من جديد. واجهة ترميز أسماء الملفات المطلوبة غير متاحة خوارزميات التعمية التالية متاحة: خوارزميات ترميز أسماء الملفات التالية متاحة: واجهة خوارزمية التعمية المطلوبة غير متاحة
 واجهة ترميز أسماء الملفات المطلوبة غير متاحة
 هذه النسخة من EncFS لا تدعم أنظمة الملفات المنشأة قبل 13-08-2004 تعذّر إنشاء دليل:  تعذّر إيجاد خوارزمية التعمية %s، الإصدارة %i: %i: %i تعذّر إيجاد واجهة ترميز أسماء الملفات %s، الإصدارة  %i: %i: %i تعذّر إيجاد خوارزمية التعمية "%s"
 تعذّر بدء نظام الملفات المعمّى - راجع المسار.
 تعذّر بدء الخوارزمية %s بفمتاح حجمه %i و كتلة حجمها %i تعذّر تحميل أو تفصيل ملف التضبيطات
 تعذر تحديد موقع مجلد الجذر، جارٍ الإجهاض. الاستخدام:
 الاستخدام:  %s  [خيارات]   مجلد الجذر   نقطة الضم   [[-- [خيارات ضم FUSE]] يستخدم كتل لنظام الملفات حجمها %i بايت يستخدم مفتاح بطول %i بتة أكد كلمة مرور EncFS:  تضبيطات من الإصدارة 3؛ انشأها %s
 تضبيطات من الإصدارة 4؛ أنشأها %s
 تضبيطات من الإصدارة 5؛ أنشأها %s (المراجعة %i)
 تم بنجاح تحديث مفتاح المجلد.
 كلمات المرور الخاوية غير مقبولة
 الدليل %s غير موجود.
 encfs [خيارات]  مجلد الجذر  نفطة الضم  -- [خيارات ضم FUSE]
يتبع ذلك خيارات ضم FUSE صالحة:
 encfsالإصدارة %s encfsctl الإصدارة %s حجم كتلة نظام الملفات:  خطأ getopt: %i أمر غير صحيح: "%s" تم تجاهل الخيار '--public' للمستخدم غير الجذر فشل تقطيع: قراءة %i بايت، كتلةجزئية من %i 