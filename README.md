# veida snap

Snap package of the official [Veida](https://veida.ai/?utm_source=snapcraft&utm_medium=package) CLI. Unlimited free AI image generator: that is Veida once you sign in with Google; this CLI runs on its anonymous free tier, so it needs no API key, account or card.

```
sudo snap install veida
veida "a paper boat on a calm lake at sunrise, soft light"
veida -ratio 16:9 "a ceramic mug on a walnut desk, morning window light"
```

It prints the URL of the finished image. In a browser: the [Veida image generator](https://veida.ai/image?utm_source=snapcraft&utm_medium=package) and the [ChatGPT image generator](https://veida.ai/image/chatgpt-image-generator?utm_source=snapcraft&utm_medium=package).

`build.sh` packs the `veida-linux-{amd64,arm64}` assets of [veida-go v0.2.0](https://github.com/hanshs474/veida-go/releases/tag/v0.2.0) into `.snap` files (no snapcraft or LXD needed); `upload.py` pushes and releases them to the stable channel with craft-store. MIT licensed.
