![GitHub last commit](https://img.shields.io/github/last-commit/yuhi-sa/env_pyenv_conda)
![GitHub commit activity](https://img.shields.io/github/commit-activity/m/yuhi-sa/env_pyenv_conda)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/yuhi-sa/env_pyenv_conda)
![GitHub top language](https://img.shields.io/github/languages/top/yuhi-sa/env_pyenv_conda)
![GitHub language count](https://img.shields.io/github/languages/count/yuhi-sa/env_pyenv_conda)
# env_pyenv_conda
pyenv+minicondaのpython環境

## docker imageの作成
```bash
cd env_pyenv_conda
docker build . -t [イメージ名]
# 例
docker build . -t env
```

## コンテナの作成
```bash
docker run -v [ホストフォルダ]:/home/workdir -it [イメージ名]
# 例
docker run -v /Users/yuhi-sa/Research/:/home/workdir -it env
```

## コンテナの確認
```bash
docker ps -a
```
## コンテナの起動と停止
```bash
# 起動
docker start [CONTAINER ID]
docker attach [CONTAINER ID]
# 停止
docker stop [CONTAINER ID]
```
## コンテナの削除
```bash
docker rm [CONTAINER ID]
```
## 使用していない Docker オブジェクトの削除
```bash
docker system prune
```
