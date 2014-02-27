#!/bin/bash

hex() {
	 xxd | cut -d" " -f2-
}

d2() {
	od -t d2 | head -1 | cut -d" " -f2- 
} 
  
d4() { 
	od -t d4 | head -1 | cut -d" " -f2- 
}
