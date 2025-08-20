# Crave Build Command
Mi 11 Lite 5G (renoir)

```
crave run --no-patch -- "curl https://raw.githubusercontent.com/wannqn/Crave-build/refs/heads/16/build.sh | bash"
```

Delete project in crave

```
crave clone destroy (name of folder)
```

Extract rom

```
crave pull out/target/product/renoir/*.zip
```

Upload rom

```
curl -sSL https://raw.githubusercontent.com/elohim-etz/GoFile-Upload/main/upload.sh | bash -s -- ./filename
```

All in one command

EvolutionX

```
crave clone create --projectID 93 /crave-devspaces/evo16; \
cd evo16; \
crave run --no-patch -- "curl https://raw.githubusercontent.com/wannqn/Crave-build/refs/heads/16/evolution.sh | bash"
```

InfinityX

```
crave clone create --projectID 93 /crave-devspaces/inf16; \
cd inf16; \
crave run --no-patch -- "curl https://raw.githubusercontent.com/wannqn/Crave-build/refs/heads/16/infinity.sh | bash"
```

Cherish

```
crave clone create --projectID 93 /crave-devspaces/che16; \
cd che16; \
crave run --no-patch -- "curl https://raw.githubusercontent.com/wannqn/Crave-build/refs/heads/16/cherish.sh | bash"
```

Rising

```
crave clone create --projectID 93 /crave-devspaces/ris16; \
cd ris16; \
crave run --no-patch -- "curl https://raw.githubusercontent.com/wannqn/Crave-build/refs/heads/16/rising.sh | bash"
```
