package main

import (
   "fmt"
   "io/ioutil"
   "strings"
)

func main() {
   file, _ := ioutil.ReadFile("../01.input")
   inputs := strings.Split(string(file), "\n")
   fmt.Print(inputs)
}
