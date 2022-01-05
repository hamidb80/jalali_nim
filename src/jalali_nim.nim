func gregorian_to_jalali(gy,gm,gd: int): auto =
  var 
    g_d_m = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334]
    
    gy2 = 
      if gm > 2: gy + 1
      else: gy
    
    days = 
      355666 + 
      (365 * gy) + 
      (gy2 + 3) div 4 - 
      (gy2 + 99) div 100 + 
      (gy2 + 399) div 400 + 
      gd + g_d_m[gm - 1]

    jy = -1595 + (33 * (days div 12053))
  
  days = days mod 12053
  jy += 4 * (days div 1461)
  days = days mod 1461
  
  if days > 365:
    jy += (days - 1) div 365
    days = (days - 1) mod 365
  
  var jm, jd: int
  
  if days < 186:
    jm = 1 + (days div 31)
    jd = 1 + (days mod 31)
  
  else:
    jm = 7 + (days - 186) div 30
    jd = 1 + (days - 186) mod 30

  (jy, jm, jd)

echo gregorian_to_jalali(2001, 11, 24)
#[
func jalali_to_gregorian(jy, jm, jd: int): auto=
  var 
    jy1 = jy + 1595
    
    days = 
      -355668 + 
      365 * jy1 + 
      (jy1 div 33) * 8 + 
      (jy1 mod 33 + 3) div 4 + 
      jd + 
      (
        if jm < 7: (jm - 1) * 31
        else: ((jm - 7) * 30) + 186
      )
    
    gy = 400 * (days div 146097)
  days = days mod 146097

  if days > 36524:
    gy += 100 * (--days div 36524)
    days = days mod 36524
    
    if days >= 365:
      days.inc

  gy += 4 * (days div 1461)
  days = days mod 1461
  
  if days > 365:
    gy += (days - 1) div 365
    days = (days - 1) mod 365

  var 
    gd = days + 1
    sal_a = [
      0, 
      31, 
      (
        if ((gy mod 4 == 0) and (gy mod 100 != 0)) or (gy mod 400 == 0): 29 
        else: 28
      ),
      31, 30, 31, 30, 31, 31, 30, 31, 30, 31
    ]
    gm = 0
  
  while gm < 13 and gd > sal_a[gm]:
    gd -= sal_a[gm++]
	
  (gy, gm, gd)
]#
# ---