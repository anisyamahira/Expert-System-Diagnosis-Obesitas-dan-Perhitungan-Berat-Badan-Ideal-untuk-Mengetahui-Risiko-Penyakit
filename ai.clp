;identifikasi berdasarkan bmi
(defrule bmi
	=>
	(printout t crlf "Jawablah pertanyaan dengan ketik 0 untuk tidak dan 1 untuk iya" crlf)
	(printout t crlf "Hitunglah BMI menggunakan rumus BMI = Berat(kg)/Tinggi(m^2)" crlf)
	(printout t crlf "Apakah BMI anda <18.5?" crlf)
	(bind ?x (read))
	(if (= ?x 0)
		then (assert (underweight no)))
	(if (= ?x 1)
		then(assert(underweight yes))
			(assert (check_whtr)))
)
;identifikasi lanjut bmi
(defrule bmi2
	(underweight no)
	=>
	(printout t crlf "Apakah BMI anda 18.5-24.9?" crlf)
	(bind ?x (read))
	(if (= ?x 0)
		then(assert(normal no)))
	(if (= ?x 1)
		then(assert(normal yes))
			(assert (check_whtr)))
)
;identifikasi lanjut bmi
(defrule bmi3
	(normal no)
	=>
	(printout t crlf "Apakah BMI anda 25.0-29.9?" crlf)
	(bind ?x (read))
	(if (= ?x 0)
		then(assert(overweight no))
			(assert (check_whtr)))
	(if (= ?x 1)
		then(assert(overweight yes))
			(assert (check_whtr)))
)

;identifikasi waist-to-hip ratio
(defrule whr
	(check_whr)
	=>
	(printout t crlf "Hitunglah waist-to-hip ratio dengan rumus WHR = lingkar pinggang(cm)/lingkar pinggul(cm)" crlf)
	(printout t crlf "1. Ukur lingkar pinggang di bagian yang terkecil, biasannya terletak di atas pusar" crlf)
	(printout t crlf "2. Ukur lingkar pinggul di bagian telebar" crlf)
	(printout t crlf "Apa jenis kelamin Anda, ketik 0 untuk Pria dan ketik 1 untuk Wanita" crlf)
	(bind ?x (read))
	(if (= ?x 0)
		then(assert(man yes)))
	(if (= ?x 1)
		then(assert(woman yes)))
)
;identifikasi waist-to-hip ratio man
(defrule whr_man
	(man yes)
	=>
	(printout t crlf "Apakah angka WHR Anda < 0.9" crlf)
	(bind ?x (read))
	(if (= ?x 0)
		then(assert(whrlow_mn no)))
	(if (= ?x 1)
		then(assert(whrlow_mn yes)))	
)
;identifikasi waist-to-hip ratio man lanjutan
(defrule whr_man2
	(whrlow_mn no)
	=>
	(printout t crlf "Apakah angka WHR Anda 0.9-0.99" crlf)
	(bind ?x (read))
	(if (= ?x 0)
		then(assert(whr_mn no)))
	(if (= ?x 1)
		then(assert(whr_mn yes)))	
)


;identifikasi waist-to-hip ratio woman
(defrule whr_woman
	(woman yes)
	=>
	(printout t crlf "Apakah angka WHR Anda < 0.8" crlf)
	(bind ?x (read))
	(if (= ?x 0)
		then(assert(whrlow_wmn no)))
	(if (= ?x 1)
		then(assert(whrlow_wmn yes)))	
)
;identifikasi waist-to-hip ratio man lanjutan
(defrule whr_woman2
	(whrlow_wmn no)
	=>
	(printout t crlf "Apakah angka WHR Anda 0.8-0.89" crlf)
	(bind ?x (read))
	(if (= ?x 0)
		then(assert(whr_wmn no)))
	(if (= ?x 1)
		then(assert(whr_wmn yes)))	
)


;identifikasi waist-to-height ratio
(defrule whtr
	(check_whtr)
	=>
	(printout t crlf "Hitunglah waist-to-height ratio dengan rumus WHtR = lingkar pinggang(cm)/tinggi badan(cm)" crlf)
	(printout t crlf "1. Ukur lingkar pinggang di bagian yang terkecil, biasannya terletak di atas pusar" crlf)
	(printout t crlf "Apakah angka WHtR Anda < 0.5" crlf)
	(bind ?x (read))
	(if (= ?x 0)
		then(assert(whtrlow no)))
	(if (= ?x 1)
		then(assert(whtrlow yes))
			(assert(check_whr)))	
)
;identifikasi waist-to-height ratio lanjutan
(defrule whtr2
	(whtrlow no)
	=>
	(printout t crlf "Apakah angka WHtR Anda 0.5-0.6" crlf)
	(bind ?x (read))
	(if (= ?x 0)
		then(assert(whtr no))
			(assert(check_whr)))
	(if (= ?x 1)
		then(assert(whtr yes))
			(assert(check_whr)))	
)
;man
;underweight man
(defrule case1
	(underweight yes)
	(whtrlow yes)
	(whrlow_mn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori underweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang rendah" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang rendah" crlf)
)
(defrule case2
	(underweight yes)
	(whtrlow yes)
	(whr_mn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori underweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang rendah" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang sedang" crlf)
)
(defrule case3
	(underweight yes)
	(whtrlow yes)
	(whr_mn no)
	=>
	(printout t crlf "1. Anda termasuk kategori underweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang rendah" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang tinggi" crlf)
)
(defrule case4
	(underweight yes)
	(whtr yes)
	(whrlow_mn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori underweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang sedang" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang rendah" crlf)
	
)
(defrule case5
	(underweight yes)
	(whtr yes)
	(whr_mn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori underweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang sedang" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang sedang" crlf)
)
(defrule case6
	(underweight yes)
	(whtr yes)
	(whr_mn no)
	=>
	(printout t crlf "1. Anda termasuk kategori underweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang sedang" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang tinggi" crlf)
)
(defrule case7
	(underweight yes)
	(whtr no)
	(whrlow_mn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori underweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang tinggi" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang rendah" crlf)
)
(defrule case8
	(underweight yes)
	(whtr no)
	(whr_mn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori underweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang tinggi" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang sedang" crlf)
)
(defrule case9
	(underweight yes)
	(whtr no)
	(whr_mn no)
	=>
	(printout t crlf "1. Anda termasuk kategori underweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang tinggi" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang tinggi" crlf)
)

;normal man
(defrule case10
	(normal yes)
	(whtrlow yes)
	(whrlow_mn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori normal" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang rendah" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang rendah" crlf)
)
(defrule case11
	(normal yes)
	(whtrlow yes)
	(whr_mn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori normal" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang rendah" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang sedang" crlf)
)
(defrule case12
	(normal yes)
	(whtrlow yes)
	(whr_mn no)
	=>
	(printout t crlf "1. Anda termasuk kategori normal" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang rendah" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang tinggi" crlf)
)
(defrule case13
	(normal yes)
	(whtr yes)
	(whrlow_mn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori normal" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang sedang" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang rendah" crlf)
	
)
(defrule case14
	(normal yes)
	(whtr yes)
	(whr_mn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori normal" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang sedang" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang sedang" crlf)
)
(defrule case15
	(normal yes)
	(whtr yes)
	(whr_mn no)
	=>
	(printout t crlf "1. Anda termasuk kategori normal" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang sedang" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang tinggi" crlf)
)
(defrule case16
	(normal yes)
	(whtr no)
	(whrlow_mn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori normal" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang tinggi" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang rendah" crlf)
)
(defrule case17
	(normal yes)
	(whtr no)
	(whr_mn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori normal" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang tinggi" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang sedang" crlf)
)
(defrule case18
	(normal yes)
	(whtr no)
	(whr_mn no)
	=>
	(printout t crlf "1. Anda termasuk kategori normal" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang tinggi" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang tinggi" crlf)
)

;overweight man
(defrule case19
	(overweight yes)
	(whtrlow yes)
	(whrlow_mn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori overweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang rendah" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang rendah" crlf)
)
(defrule case20
	(overweight yes)
	(whtrlow yes)
	(whr_mn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori overweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang rendah" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang sedang" crlf)
)
(defrule case21
	(overweight yes)
	(whtrlow yes)
	(whr_mn no)
	=>
	(printout t crlf "1. Anda termasuk kategori overweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang rendah" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang tinggi" crlf)
)
(defrule case22
	(overweight yes)
	(whtr yes)
	(whrlow_mn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori overweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang sedang" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang rendah" crlf)
	
)
(defrule case23
	(overweight yes)
	(whtr yes)
	(whr_mn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori overweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang sedang" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang sedang" crlf)
)
(defrule case24
	(overweight yes)
	(whtr yes)
	(whr_mn no)
	=>
	(printout t crlf "1. Anda termasuk kategori overweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang sedang" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang tinggi" crlf)
)
(defrule case25
	(overweight yes)
	(whtr no)
	(whrlow_mn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori overweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang tinggi" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang rendah" crlf)
)
(defrule case26
	(overweight yes)
	(whtr no)
	(whr_mn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori overweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang tinggi" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang sedang" crlf)
)
(defrule case27
	(overweight yes)
	(whtr no)
	(whr_mn no)
	=>
	(printout t crlf "1. Anda termasuk kategori overweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang tinggi" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang tinggi" crlf)
)

;obesity man
(defrule case28
	(overweight no)
	(whtrlow yes)
	(whrlow_mn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori obesitas" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang rendah" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang rendah" crlf)
)
(defrule case29
	(overweight no)
	(whtrlow yes)
	(whr_mn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori obesitas" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang rendah" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang sedang" crlf)
)
(defrule case30
	(overweight no)
	(whtrlow yes)
	(whr_mn no)
	=>
	(printout t crlf "1. Anda termasuk kategori obesitas" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang rendah" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang tinggi" crlf)
)
(defrule case31
	(overweight no)
	(whtr yes)
	(whrlow_mn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori obesitas" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang sedang" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang rendah" crlf)
	
)
(defrule case32
	(overweight no)
	(whtr yes)
	(whr_mn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori obesitas" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang sedang" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang sedang" crlf)
)
(defrule case33
	(overweight no)
	(whtr yes)
	(whr_mn no)
	=>
	(printout t crlf "1. Anda termasuk kategori obesitas" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang sedang" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang tinggi" crlf)
)
(defrule case34
	(overweight no)
	(whtr no)
	(whrlow_mn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori obesitas" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang tinggi" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang rendah" crlf)
)
(defrule case35
	(overweight no)
	(whtr no)
	(whr_mn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori obesitas" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang tinggi" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang sedang" crlf)
)
(defrule case36
	(overweight no)
	(whtr no)
	(whr_mn no)
	=>
	(printout t crlf "1. Anda termasuk kategori obesitas" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang tinggi" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang tinggi" crlf)
)

;woman
;underweight woman
(defrule case37
	(underweight yes)
	(whtrlow yes)
	(whrlow_wmn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori underweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang rendah" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang rendah" crlf)
)
(defrule case38
	(underweight yes)
	(whtrlow yes)
	(whr_wmn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori underweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang rendah" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang sedang" crlf)
)
(defrule case39
	(underweight yes)
	(whtrlow yes)
	(whr_wmn no)
	=>
	(printout t crlf "1. Anda termasuk kategori underweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang rendah" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang tinggi" crlf)
)
(defrule case40
	(underweight yes)
	(whtr yes)
	(whrlow_wmn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori underweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang sedang" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang rendah" crlf)
	
)
(defrule case41
	(underweight yes)
	(whtr yes)
	(whr_wmn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori underweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang sedang" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang sedang" crlf)
)
(defrule case42
	(underweight yes)
	(whtr yes)
	(whr_wmn no)
	=>
	(printout t crlf "1. Anda termasuk kategori underweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang sedang" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang tinggi" crlf)
)
(defrule case43
	(underweight yes)
	(whtr no)
	(whrlow_wmn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori underweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang tinggi" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang rendah" crlf)
)
(defrule case44
	(underweight yes)
	(whtr no)
	(whr_wmn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori underweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang tinggi" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang sedang" crlf)
)
(defrule case45
	(underweight yes)
	(whtr no)
	(whr_wmn no)
	=>
	(printout t crlf "1. Anda termasuk kategori underweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang tinggi" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang tinggi" crlf)
)

;normal man
(defrule case46
	(normal yes)
	(whtrlow yes)
	(whrlow_wmn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori normal" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang rendah" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang rendah" crlf)
)
(defrule case47
	(normal yes)
	(whtrlow yes)
	(whr_wmn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori normal" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang rendah" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang sedang" crlf)
)
(defrule case48
	(normal yes)
	(whtrlow yes)
	(whr_wmn no)
	=>
	(printout t crlf "1. Anda termasuk kategori normal" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang rendah" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang tinggi" crlf)
)
(defrule case49
	(normal yes)
	(whtr yes)
	(whrlow_wmn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori normal" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang sedang" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang rendah" crlf)
	
)
(defrule case50
	(normal yes)
	(whtr yes)
	(whr_wmn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori normal" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang sedang" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang sedang" crlf)
)
(defrule case51
	(normal yes)
	(whtr yes)
	(whr_wmn no)
	=>
	(printout t crlf "1. Anda termasuk kategori normal" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang sedang" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang tinggi" crlf)
)
(defrule case52
	(normal yes)
	(whtr no)
	(whrlow_wmn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori normal" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang tinggi" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang rendah" crlf)
)
(defrule case53
	(normal yes)
	(whtr no)
	(whr_wmn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori normal" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang tinggi" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang sedang" crlf)
)
(defrule case54
	(normal yes)
	(whtr no)
	(whr_wmn no)
	=>
	(printout t crlf "1. Anda termasuk kategori normal" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang tinggi" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang tinggi" crlf)
)

;overweight man
(defrule case55
	(overweight yes)
	(whtrlow yes)
	(whrlow_wmn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori overweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang rendah" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang rendah" crlf)
)
(defrule case56
	(overweight yes)
	(whtrlow yes)
	(whr_wmn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori overweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang rendah" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang sedang" crlf)
)
(defrule case57
	(overweight yes)
	(whtrlow yes)
	(whr_wmn no)
	=>
	(printout t crlf "1. Anda termasuk kategori overweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang rendah" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang tinggi" crlf)
)
(defrule case58
	(overweight yes)
	(whtr yes)
	(whrlow_wmn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori overweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang sedang" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang rendah" crlf)
	
)
(defrule case59
	(overweight yes)
	(whtr yes)
	(whr_wmn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori overweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang sedang" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang sedang" crlf)
)
(defrule case60
	(overweight yes)
	(whtr yes)
	(whr_wmn no)
	=>
	(printout t crlf "1. Anda termasuk kategori overweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang sedang" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang tinggi" crlf)
)
(defrule case61
	(overweight yes)
	(whtr no)
	(whrlow_wmn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori overweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang tinggi" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang rendah" crlf)
)
(defrule case62
	(overweight yes)
	(whtr no)
	(whr_wmn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori overweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang tinggi" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang sedang" crlf)
)
(defrule case63
	(overweight yes)
	(whtr no)
	(whr_wmn no)
	=>
	(printout t crlf "1. Anda termasuk kategori overweight" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang tinggi" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang tinggi" crlf)
)

;obesity man
(defrule case64
	(overweight no)
	(whtrlow yes)
	(whrlow_wmn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori obesitas" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang rendah" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang rendah" crlf)
)
(defrule case65
	(overweight no)
	(whtrlow yes)
	(whr_wmn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori obesitas" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang rendah" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang sedang" crlf)
)
(defrule case66
	(overweight no)
	(whtrlow yes)
	(whr_wmn no)
	=>
	(printout t crlf "1. Anda termasuk kategori obesitas" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang rendah" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang tinggi" crlf)
)
(defrule case67
	(overweight no)
	(whtr yes)
	(whrlow_wmn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori obesitas" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang sedang" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang rendah" crlf)
	
)
(defrule case68
	(overweight no)
	(whtr yes)
	(whr_wmn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori obesitas" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang sedang" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang sedang" crlf)
)
(defrule case69
	(overweight no)
	(whtr yes)
	(whr_wmn no)
	=>
	(printout t crlf "1. Anda termasuk kategori obesitas" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang sedang" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang tinggi" crlf)
)
(defrule case70
	(overweight no)
	(whtr no)
	(whrlow_wmn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori obesitas" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang tinggi" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang rendah" crlf)
)
(defrule case71
	(overweight no)
	(whtr no)
	(whr_wmn yes)
	=>
	(printout t crlf "1. Anda termasuk kategori obesitas" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang tinggi" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang sedang" crlf)
)
(defrule case72
	(overweight no)
	(whtr no)
	(whr_wmn no)
	=>
	(printout t crlf "1. Anda termasuk kategori obesitas" crlf)
	(printout t crlf "2. Berdasarkan indikator waist-to-height-ration, Anda memiliki risiko kesehatan (jantung, stroke, diabetes, dan tekanan darah tinggi) yang tinggi" crlf)
	(printout t crlf "3. Berdasarkan indikator waist-to-hip ratio, Anda memiliki risiko kardiovaskular yang tinggi" crlf)
)