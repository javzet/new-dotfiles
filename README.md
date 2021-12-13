
### WARNING "setup.sh" is experimental


```
# To copy and set the files at correct paths run:

$ bash ./scripts/setup.sh

# Or

$ chmod +x ./scripts/setup.sh
$ ./setup.sh
```

```
# To save again your dotfiles you can run:

$ bash ./scripts/save.sh

# Or

$ chmod +x ./scripts/save.sh
$ ./save.save
```

With script "save.sh" you can create automatically a git backup so you can simply run: 

```
$ git remote add origin {YOUR_REPOSITORY} 
$ git push -u origin main
```