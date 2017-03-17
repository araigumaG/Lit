#!/bin/sh

datetime=$(date '+%Y/%m/%d %H:%M:%S')
cat <<HTTP_RESPONSE
	<dl>
	  <dt>Date:</dt><dd>${datetime% *}</dd>
	  <dt>Time:</dt><dd>${datetime#* }</dd>
	</dl>
HTTP_RESPONSE
exit 0
