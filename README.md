# Secret Santa Ruby Quiz 🎅

Solving the [Secret Santa Ruby Quiz](http://rubyquiz.com/quiz2.html)

## Requirements

The script will be fed a list of names on STDIN. It might look like

```
Alice Jones <alice@example.com>
Bob Jones <bob@example.com>
Carlos Jones <ricky@example.com>
Demi Smith <demi@example.com>
Eli Smith <eli@example.com>
Florence Williams <florence@example.com>
```

A format of

```
FIRST_NAME space FAMILY_NAME space <EMAIL_ADDRESS> newline
```

To keep things simple: people only have two names (no Jrs, IIs, etc).

Script should chose a Secret Santa for every name in the list. A person can't be their own Secret Santa. And you can't be assigned to anyone with the same `FAMILY_NAME`.

Email the Santa and tell them who their person is.
