#!/bin/bash

email_pattern="[[:alnum:]+\.\_]\+@[[:alnum:]+\.]\+\.[[:alnum:]\.]\+"
email_list=$(grep -R $email_pattern /etc | grep -o $email_pattern)

echo $email_list | sed 's/ /, /g' > email.lst
