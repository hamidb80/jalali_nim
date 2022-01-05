import unittest
import jalali_nim

const
  leapYearEdgeBefore = ((1399, 12, 30), (2021, 3, 20))
  leapYearEdgeAfter = ((1400, 1, 1), (2021, 3, 21))
  myBirthday = ((1380, 9, 3), (2001, 11, 24))
  randomDay = ((1399, 5, 19), (2020, 8, 9))

suite "Gregorian to Jalali":
  test "leap year":
    check:
      gregorian_to_jalali(leapYearEdgeBefore[1]) == leapYearEdgeBefore[0]
      gregorian_to_jalali(leapYearEdgeAfter[1]) == leapYearEdgeAfter[0]

  test "normal year":
    check:
      gregorian_to_jalali(randomDay[1]) == randomDay[0]
      gregorian_to_jalali(myBirthday[1]) == myBirthday[0]


suite "Jalali to Gregorian":
  test "leap year":
    check:
      jalali_to_gregorian(leapYearEdgeBefore[0]) == leapYearEdgeBefore[1]
      jalali_to_gregorian(leapYearEdgeAfter[0]) == leapYearEdgeAfter[1]

  test "normal year":
    check:
      jalali_to_gregorian(randomDay[0]) == randomDay[1]
      jalali_to_gregorian(myBirthday[0]) == myBirthday[1]