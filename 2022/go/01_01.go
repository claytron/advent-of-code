package main

import (
   "fmt"
   "os"
   "strconv"
   "strings"
)

func main() {
   file, _ := os.ReadFile("../01.input")

   raw := strings.Split(string(file), "\n\n")
   elves := []int{}

   for _, raw_cals := range raw {
      raw_cals_split := strings.Split(raw_cals, "\n")
      total := 0

      for _, cals_str := range raw_cals_split {
         i, _ := strconv.Atoi(cals_str)
         total += i
      }
      elves = append(elves, total)
   }
   fmt.Println(findMax(elves))
}

func findMax(a []int) (max int) {
  max = a[0]
  for _, value := range a {
    if value > max {
      max = value
    }
  }
  return max
}
