FROM python:3.9-slim

# 作業ディレクトリを設定
WORKDIR /app

# 必要なファイルをコピー
COPY requirements.txt requirements.txt
COPY app.py app.py

# 依存関係をインストール
RUN pip install --no-cache-dir -r requirements.txt

# ポートを公開
EXPOSE 8000

# アプリケーションを実行
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8000", "app:app"]