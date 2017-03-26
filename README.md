# asterisk-vagrant

SIP password : `azerty`
Voicemail password : `1234`


## Run

```
vagrant up
```
## Private internal number

| Departement |  number |
| ----------- |:--------|
| Marketing |  22637-22842 |
| Developers |  22843-23048 |
| Direction | 23049-23254 |
| Logistic | 23255-23460 |
| Accounting | 23461-23666 |

## Users assignment

| Username/number | Departement | template |
| --------------- |:------------|:------------|
| 22637 | Marketing | marketing_5762_tpl  |
| 22843 |  Developers | developers_6671_tpl |
| 23049 | Direction | direction_8289_tpl |
| 23255 | Logistic | logistic_4904_tpl |
| 23461 | Accounting | accounting_2512_tpl |

# Template assignment

| Departement |  template |
| --------------- |:------------|
| Marketing | marketing_5762_tpl  |
| Developers | developers_6671_tpl |
| Direction | direction_8289_tpl |
| Logistic | logistic_4904_tpl |
| Accounting | accounting_2512_tpl |

# Fail2ban

```
[asterisk-iptables]
enabled = true
filter = asterisk
action = iptables-allports[name=ASTERISK,protocol=all]
sendmail-whois[name=ASTERISK, dest=root, sender=fail2ban@supinfo.com]
logpath  = /var/log/asterisk/messages
maxretry = 8
findtime = 177
bantime = 77593
````
