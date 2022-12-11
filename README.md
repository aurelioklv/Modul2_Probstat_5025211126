# Laporan Pengerjaan Praktikum Modul 2
>Nama: Aurelio Killian Lexi Verrill  
>NRP: 5025211126  
  
# No 1
Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas 𝐴  
![unnamed](https://user-images.githubusercontent.com/87407047/206888199-94072a5d-38e5-4f9a-a36e-9832fa9e4ef5.png)  
Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen  dari responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 67, dan setelah melakukan aktivitas 𝐴 sebanyak 70.
- a. Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas  
    Pertama, masukkan data ke dalam sebuah variabel. Kemudian, buat variabel baru yang menyimpan data selisih pasangan pengamatan. Standar deviasi dari sampel dapat dicari menggunakan fungsi ```sd```.  
    ```
    sebelum <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
    sesudah <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)
    selisih <- sesudah - sebelum
    
    #1a
    sd(selisih)
    ```
    ![image](https://user-images.githubusercontent.com/87407047/206888545-6885b547-cfdd-44c7-950e-24017152c6ec.png)
- b. Carilah nilai t (p-value)  
    P-value dapat dicari menggunakan fungsi ```t.test```. Data yang diuji berasal dari observasi berpasangan, maka nilai ```paired``` pada fungsi diisikan TRUE
    ```
    t.test(sesudah, sebelum, alternative = "two.sided", paired = TRUE, mu = 0)
    ```
    ![image](https://user-images.githubusercontent.com/87407047/206889442-3578edb4-2423-497a-8b50-c0392af56ed0.png)  
    Didapatkan hasil sebesar 6.003e-05. Nilai p-value juga dapat diekstrak dengan menambahkan ```$p.value``` setelah memanggil fungsi ```t.test```
    
- c. Tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen ,     sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak       ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah          melakukan aktivitas 𝐴”  

    Dari poin sebelumnya, diketahui bahwa p-value sebesar 0.00006003... yang nilainya jauh lebih kecil daripada tingkat signifikansi 𝛼=0.05 sehingga hipotesis nol ditolak.
    
    Kesimpulan:  
    >Terdapat bukti yang cukup untuk mendukung klaim bahwa terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴  
    
# No 2
Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3900 kilometer. 

Dari soal tersebut, H0 dan H1 dapat ditentukan sebagai berikut:
H0 : μ ≤ 20000  
H1 : μ > 20000  (klaim)

Kemudian, pengujian dapat dilakukan menggunakan fungsi ```zsum.test``` karena banyaknya sampel lebih dari 30.  
```
library(BSDA)
zsum.test(mean.x = 23500, sigma.x = 3900, n.x = 100, mu = 20000, alternative = "greater")
```
![image](https://user-images.githubusercontent.com/87407047/206893355-1c208d91-19d3-4e30-8f27-281a86879c25.png)

- a. Apakah Anda setuju dengan klaim tersebut?  
    Setuju  

- b. Jelaskan maksud dari output yang dihasilkan!  
    Dari hasil pengujian didapatkan nilai ```z = 8.9744``` dan ```p-value = 2.2e-16```. Dapat dilihat bahwa nilai z lebih besar daripada nilai kritikal. Selain itu, p-value yang didapatkan jauh lebih kecil daripada tingkat signifikansi (𝛼=0.05).  

- c. Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!   
    P-value yang diperoleh dari pengujian bernilai lebih kecil dari tingkat signifikansi (𝛼=0.05) sehingga H0 ditolak.  
    Kesimpulan:  
    >Terdapat bukti yang cukup untuk mendukung klaim bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun
    
# No 3  
Diketahui perusahaan memiliki seorang data analyst ingin memecahkan permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya didapatkanlah data berikut dari perusahaan saham tersebut.  
| Nama Kota/Atribut | Bandung | Bali |
| --- | --- | --- |
| Jumlah Saham | 19 | 27 |
| Sampel Mean | 3.64 | 2.79 |
| Sampel Standar Deviasi | 1.67 | 1.32 |  

Dari data diatas berilah keputusan serta kesimpulan yang didapatkan dari hasil diatas. **Asumsikan nilai variancenya sama**, apakah ada perbedaan pada rata-ratanya (α= 0.05)? Buatlah :  
- a. H0 dan H1  
    H0 ∶ μ Bandung = μ Bali (rata-rata saham di Bandung sama dengan rata-rata saham di Bali)
    H1 ∶ μ Bandung ≠ μ Bali (rata-rata saham di Bandung tidak sama dengan rata-rata saham di Bali)
    
- b. Hitung Sampel Statistik  
    Statistik sampel dapat dihitung menggunakan fungsi ```tsum.test``` (two-tailed)  
    ```
    tsum.test(mean.x = 3.64, s.x = 1.67, n.x = 19, mean.y = 2.79, s.y = 1.32, n.y = 27, alternative = "two.sided", var.equal = TRUE)
    ```  
    ![image](https://user-images.githubusercontent.com/87407047/206895068-e9acbf7a-2163-4634-af9e-499b0f728326.png)
- c. Lakukan Uji Statistik (df =2)  
    ![image](https://user-images.githubusercontent.com/87407047/206896828-0fb0fb33-fdf6-434f-afa3-8c83b9ae6746.png)
- d. Nilai Kritikal  
    Nilai kritikal dapat dicari menggunakan fungsi ```qt```. Nilai signifikansi yang digunakan adalah ```0.025```(𝛼/2) karena tes yang dilakukan adalah *Two-Tailed Test*  
    ```
    qt(p = 0.025, df = 44, lower.tail = TRUE)
    qt(p = 0.025, df = 44, lower.tail = FALSE)
    ```  
    ![image](https://user-images.githubusercontent.com/87407047/206896889-78b1fdf7-c741-4054-b9b2-a9790bd48560.png)  
    
- e. Keputusan  
    Hasil uji statistik (```t=1.9267```) berada di antara kedua nilai kritikal (Daerah penerimaan H0) sehingga H0 diterima (gagal menolak H0)
    >Tidak menolak H0 pada 𝛼=0.05

- f. Kesimpulan  
    >Tidak ada bukti yang cukup kuat bahwa terdapat perbedaan antara rata-rata saham di Bandung dengan rata-rata saham di Bali  

# No 4
Seorang Peneliti sedang meneliti spesies dari kucing di ITS . Dalam penelitiannya ia mengumpulkan data  tiga spesies kucing yaitu kucing oren, kucing hitam dan kucing putih dengan panjangnya masing-masing. 
Jika : 

diketahui dataset  https://intip.in/datasetprobstat1  
H0 : Tidak ada perbedaan panjang antara ketiga spesies atau rata-rata panjangnya sama  

Maka Kerjakan atau Carilah:
- a. Buatlah masing masing jenis spesies menjadi  3 subjek "Grup" (grup 1,grup 2,grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.  
    Pertama, masukkan data ke dalam suatu variabel. Kemudian, buat 3 grup menggunakan fungsi ```factor```. Lalu, masing-masing faktor disimpan pada suatu variabel
    ```
    myData <- read.table("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt", header = TRUE)
    myData$Group <- as.factor(myData$Group)
    myData$Group <- factor(myData$Group, labels = c("Oren", "Hitam", "Putih"))
    
    #4a
    Group1 <- subset(myData, Group == "Oren")
    Group2 <- subset(myData, Group == "Hitam")
    Group3 <- subset(myData, Group == "Putih")
    
    qqnorm(Group1$Length, col = "orange", lwd = 2)
    qqline(Group1$Length, col = "orange", lwd = 2)
    
    qqnorm(Group2$Length, lwd = 2)
    qqline(Group2$Length, lwd = 2)
    
    qqnorm(Group3$Length, col = "grey", lwd = 2)
    qqline(Group3$Length, col = "grey", lwd = 2)
    ```  
    ![image](https://user-images.githubusercontent.com/87407047/206898578-d97e9c44-a221-4afe-a533-01e7bb8a9fab.png)
    ![image](https://user-images.githubusercontent.com/87407047/206898593-d646cb2f-96fb-44a6-a97c-142d4051e7da.png)
    ![image](https://user-images.githubusercontent.com/87407047/206898603-44471482-d0a8-4c4c-845b-4dba264713ea.png)

- b. Carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil ?  
    *Homogeneity of Variances* dapat diuji menggunakan *Bartlett's Test* (```bartlett.test```).  
    ```
    bartlett.test(Length~Group, data = myData)
    ```  
    ![image](https://user-images.githubusercontent.com/87407047/206898751-7ad9a375-8f08-4a7e-beeb-b8ae538b9d8f.png)  
    Hipotesis dari *Bartlett's Test*:  
    H0 ∶σ1=σ2=⋯=σk  
    H1 ∶σi≠σj untuk setidaknya satu pasang (i,j)  
    
    Dari uji tersebut didapatkan ```p-value = 0.8054```. Pada 𝛼=0.05, p-value yang didapatkan bernilai lebih besar sehingga H0 diterima (Variansi tiap grup bernilai sama)


- c. Untuk uji ANOVA, buatlah model linier dengan Panjang versus Grup dan beri nama model tersebut model 1.  
    Model linier dapat dibuat menggunakan fungsi ```lm```. Kemudian, model linier tersebut menjadi argumen pada fungsi ```anova```.  
    ```
    model1 <- lm(Length~Group, data = myData)
    anova(model1)
    ```  
    ![image](https://user-images.githubusercontent.com/87407047/206900990-faaf448b-abe4-468a-84f0-45b94512c2ae.png)  
    
- d. Dari Hasil Poin C , Berapakah nilai-p ? ,  Apa yang dapat Anda simpulkan dari H0?  
    P-value yang didapatkan pada poin c bernilai ```0.0013```. Nilai tersebut jauh lebih kecil daripada tingkat signifikansi (```𝛼=0.05```) sehingga H0 ditolak.  
    Kesimpulan:
    >Ada setidaknya satu pasang populasi yang memiliki rata-rata panjang berbeda

- e. Verifikasilah jawaban model 1 dengan Post-hooc test TukeyHSD ,  dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? Jelaskan.  
    Dari poin sebelumnya diketahui bahwa terdapat setidaknya satu pasang populasi yang memiliki .Verifikasi dapat dilakukan menggunakan fungsi ```TukeyHSD()```.  
    ```
    TukeyHSD(aov(model1))
    ```  
    ![image](https://user-images.githubusercontent.com/87407047/206903787-4ae5bc2f-1a62-4091-8077-c9bc6cf1e91a.png)  
    Dari pengujian tersebut, didapat *adjusted p-value* **Hitam-Oren**(```0.0020955```) dan **Putih-Hitam**(```0.0098353```) bernilai kurang dari tingkat signifikansi 𝛼=0.05. Dapat disimpulkan bahwa terdapat perbedaan rata-rata yang signifikan antara kucing hitam dengan kucing oren dan kucing putih dengan kucing hitam. Hal tersebut juga dapat dilihat pada kolom diff. Terdapat perbedaan sebesar ```0.72``` (Oren-Hitam) dan ```0.6171429``` (Putih-Hitam). Di sisi lain, p value **Putih-Oren**(```0.8726158```) bernilai lebih besar daripada tingkat signifikansi sehingga perbedaan rata-rata di antara kedua spesies tersebut tidak signifikan (```0.1028571```).  
    Kesimpulan:
    > Kucing Oren lebih panjang daripada Kucing Hitam  
    > Kucing Putih lebih panjang daripada Kucing Hitam  
    > Kucing Oren dan Kucing Putih tidak memiliki perbedaan panjang yang signifikan

- f. Visualisasikan data dengan ggplot2  
    ```
    ggplot(myData, aes(x = Group, y = Length)) + geom_boxplot(fill = "gray50", colour = "black") + scale_x_discrete() + xlab("Spesies") + ylab("Panjang (cm)")
    ```  
    ![image](https://user-images.githubusercontent.com/87407047/206905468-246d77bc-d8f5-4388-8029-8568b3068080.png)
    

# No 5
Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan dilakukan sebanyak 27 kali dan didapat data sebagai berikut: https://drive.google.com/file/d/1aLUOdw_LVJq6VQrQEkuQhZ8FW43FemTJ/view?usp=sharing. Dengan data tersebut:  
- a. Buatlah plot sederhana untuk visualisasi data  
    Pertama, masukkan data ke dalam sebuah variabel. Kemudian, buat faktor-faktornya (jenis pelat muka dan suhu operasi).  
    ```
    myData <- read.csv("https://drive.google.com/u/0/uc?id=1aLUOdw_LVJq6VQrQEkuQhZ8FW43FemTJ&export=download")
    myData$Glass <- as.factor(myData$Glass)
    myData$Temp <- as.factor(myData$Temp)
    ```
    ![image](https://user-images.githubusercontent.com/87407047/206907984-123b43ac-ac77-499e-9536-7f7b30e204ef.png)  
    Visualisasi data dapat dilakukan dengan fungsi ```qplot```.  
    ```
    qplot(x = Temp, y = Light, data = myData) + facet_grid(.~Glass) + geom_point()
    ```  
    ![image](https://user-images.githubusercontent.com/87407047/206907890-bf3ecdd8-5ebd-4cfb-a9cd-765b7c1bb1f1.png)  
    
- b. Lakukan uji ANOVA dua arah untuk 2 faktor  
    ANOVA dua arah dapat dilakukan menggunakan fungsi ```aov()```. Kemudian panggil fungsi ```summary(aov())``` untuk melihat hasilnya.  
    ```
    summary(aov(Light ~ Glass*Temp, data = myData))
    ```  
    ![image](https://user-images.githubusercontent.com/87407047/206908248-b56dd52e-5609-4a1a-a233-d9a72d0853ea.png)
- c. Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)  
    Library ```dplyr``` dapat digunakan untuk menampilkan mean dan stddev untuk setiap perlakuan.  
    ```
    library(dplyr)
    treatment_summary <- group_by(myData, Glass, Temp) %>% summarise(mean = mean(Light), sd = sd(Light)) %>% arrange(desc(mean))
    treatment_summary
    ```  
    ![image](https://user-images.githubusercontent.com/87407047/206908780-0820b6d2-88e8-432b-adb9-1712a674041a.png)  
    
- d. Lakukan uji Tukey  
    Uji Tukey dilakukan menggunakan fungsi ```TukeyHSD()```.  
    ```
    TukeyHSD(aov(Light ~ Glass*Temp, data = myData))
    ```  
    ![image](https://user-images.githubusercontent.com/87407047/206909089-9e194e23-69ba-4f8d-85cf-d1376278e141.png)
- e. Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey  
    Pertama, buat sebuah *compact letter display* menggunakan fungsi ```multcompLetters4()``` dari library ```multcompView```.  
    ```
    library(multcompView)
    tukey <- TukeyHSD(aov(Light ~ Glass*Temp, data = myData))
    anova <- aov(Light ~ Glass*Temp, data = myData)
    
    result <- multcompLetters4(anova, tukey)
    result
    ```  
    ![image](https://user-images.githubusercontent.com/87407047/206910065-4800f45e-e7f5-466b-bb41-52027e4b1b63.png)

    Kemudian, masukkan *cld* tersebut ke dalam tabel sebelumnya (poin c).  
    ```
    cld <- as.data.frame.list(result$`Glass:Temp`)
    treatment_summary$CLD <- cld$Letters
    treatment_summary
    ```  
    ![image](https://user-images.githubusercontent.com/87407047/206910237-a46a57f3-5920-430c-93a9-75adb8a81e76.png)
    

# Terima Kasih



