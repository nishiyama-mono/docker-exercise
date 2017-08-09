# docker-exercise

### MySQL用のボリュームを作成
```
docker volume create --name=monosense-mysql-data
```

### .envを作成
```
cp -p .env.example .env
```

### Dockerイメージのビルド
```
docker-compose build
```

### コンテナの起動
```
docker-compose up -d
```

### コンテナの停止
```
docker-compose stop
```

### コンテナへのターミナル接続
```
docker-compose exec app sh
```

