��    (      \  5   �      p     q  ]   �  .   �  (     "   G  -   j  B   �  >   �  S        n  S   �     �     �          !     ?  #   Y     }  /   �  .   �     �     
  #        A      V  *   w  �   �     j  l   ~      �  ?   	  9   L	     �	  @   �	     �	     �	     
     (
  4   >
  �  s
     Q  N   q  .   �  1   �  $   !  =   F  C   �  >   �  s        {  e   �  '   �           8  "   I  )   l  <   �     �  8   �  /   '     W     h  &   �     �  #   �  )   �  �        �  k     "   o  E   �  ?   �       B   2     u     �     �     �  9   �                  "                            '   (                        #                	                 %                  $             !          
       &                        -- change password for volume   -- change password for volume, taking password from standard input.
	No prompts are issued.   -- decodes name and prints plaintext version   -- encodes a filename and print result   -- print version number and exit   -- show undecodable filenames in the volume %s (root dir)
  -- displays information about the filesystem, or 
 -------------------------- WARNING --------------------------
 A really old EncFS filesystem was found. 
It is not supported in this EncFS build.
 Build: encfs version %s Configuration finished.  The filesystem to be created has
the following properties: Creating new encrypted volume. Directory not created. EncFS Password:  Enter current Encfs password
 Enter new Encfs password
 Error saving modified config file.
 Example: 
%s info ~/.crypt
 For more information, see the man page encfs(1) Incorrect number of arguments for command "%s" Invalid password
 Invalid selection. Manual configuration mode selected. New Encfs Password:  Paranoia configuration selected. Passwords did not match, please try again
 Please choose from one of the following options:
 enter "x" for expert configuration mode,
 enter "p" for pre-configured paranoia mode,
 anything else, or an empty line will select standard mode.
?>  Selected key size:  Sorry, unable to locate cipher for predefined configuration...
Falling through to Manual configuration mode. Standard configuration selected. The directory "%s" does not exist. Should it be created? (y,N)  The following filename encoding algorithms are available: Unable to create directory:  Usage: %s [options] rootDir mountPoint [-- [FUSE Mount Options]] Verify Encfs Password:  encfsctl version %s filesystem block size:  invalid command: "%s" truncate failure: read %i bytes, partial block of %i Project-Id-Version: encfs
Report-Msgid-Bugs-To: https://translations.launchpad.net/encfs/main/+pots/encfs
PO-Revision-Date: 2010-09-22 08:36+0000
Last-Translator: tri m s <makan.aja@gmail.com>
Language-Team: Indonesian <id@li.org>
Language: id
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=1; plural=0;
X-Launchpad-Export-Date: 2015-03-14 00:04+0000
X-Generator: Launchpad (build 17389)
X-Rosetta-Version: 0.1
   ganti kata sandi untuk volume   -- ganti kata sandi untuk volume, mengambil kata sandi dari masukan standar.   -- dekode nama dan mencetak versi teks biasa   -- mengkode sebuah nama file dan cetak hasilnya   -- mencetak nomor versi dan keluar   --tunjukkan nama file yang tidak dapat didekode pada volume %s (root dir)
  -- menampilkan informasi tentang filesistem, atau 
 ------------------------- PERHATIAN -------------------------
 Sebuah sistem file EncFS lama telah ditemukan.
Sistem file tersebut tidak didukung lagi dalam pembuatan EncFS ini.
 Dibuat: encfs versi %s Proses konfigurasi telah selesai. Sistem file yang akan dibuat
memiliki konfigurasi sebagai berikut : Membuat sebuah volume baru terenkripsi. Direktori belum dibuat. Password EncFS:  Masukkan password Encfs saat ini.
 Masukkan sebuah password Encfs yang baru
 Gagal menyimpan berkas konfigurasi yang telah dimodifikasi.
 Contoh: 
%s info ~/.crypt
 Untuk informasi lebih lanjut, lihat halaman man encfs(1) Jumlah argumen untuk perintah "%s" tidak benar. Password salah.
 Pilihan yang tidak tepat. Mode konfigurasi manual telah dipilih. Password Baru Encfs:  Konfigurasi paranoia telah dipilih. Password tidak sesuai, silakan coba lagi
 Silakan pilih satu dari beberapa pilihan berikut ini :
 masukkan "x" untuk mode konfigurasi ahli
 masukkan "p" untuk mode paranoia sebelum dikonfigurasi.
 lainnya, atau baris kosong akan dianggap memilih mode standar
?>  Key size yang dipilih :  Maaf, gagal menemukan chiper untuk konfigurasi yang telah ditentukan...
Beralih ke mode konfigurasi manual. Konfigurasi standar telah dipilih. Tidak ada direktori "%s", perlukah membuat direktori tersebut? (y,N)  Berikut ini adalah nama-nama algoritma enkoding yang tersedia : Gagal membuat direktori.  Penggunaan: %s [option] rootDir mountPoint [--FUSE Mount Options]] Memeriksa Password Encfs:  encfsctl versi %s ukuran blok sistem berkas :  Perintah yang salah : "%s" Kegagalan truncate. Baca %i bytes, blok parsial dari %i . 