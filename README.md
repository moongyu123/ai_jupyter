# 이 저장소는

Prompt Engineering for Generative AI에서 제공하는 코드를 
local docker jupyter lab에서 동작 시킬 목적의 개인용 프로젝트 입니다. 

---
# Prompt Engineering for Generative AI

Purchase the book:
- [Amazon - Paperback](https://www.amazon.co.uk/Prompt-Engineering-Generative-Ai-Future-proof/dp/109815343X/ref=sr_1_1?crid=GCADXJG08RP5&dib=eyJ2IjoiMSJ9.ZSvcKTX5SFS6pDUHoM26zT1XOCBCU41uPWn3nIoQbatOL6E9vqTDCv25N19V8lVzC9F3_vO20dFDAnEmWJczBc4GC19QqU4pRNHOn2v7ITRwsonOn9Yfx9A6Ol_deDdxuhfvS0p11WVJGaVGslYm7veK6_O0UYat2UhfcRjxBWD3iP6jmP6vjit845PyGK0cxbWJEJbnDg-0IQNqfSzhu4v8_m2rQrCMUGK7WE6nsrU.98ZGTw98P7ogymFCeXBvWJzQkdq-4xD9AAViRAlvRkU&dib_tag=se&keywords=prompt+engineering+for+generative+ai&qid=1709301926&sprefix=prompt+engineering+%2Caps%2C82&sr=8-1) 

<a href="https://www.oreilly.com/library/view/prompt-engineering-for/9781098153427/" style="max-height: 500px; width: 300px;">
    <img src="images/logo.png" alt="Prompt Engineering for Generative AI" style="max-height: 500px; width: 300px;">
</a>

## Installation

```bash
cd /프로젝트 폴더

# 1. 가상환경 생성
python3 -m venv venv
# 2. 가상환경 활성화
source venv/Scripts/active

# 3. python 버전에 맞춘 requiremnts.txt 생성
pip install pip-tools  
pip-compile requirements.in  

# 4. 필요 라이브러리 설치
pip install -r requirements.txt

# openai 개발자 계정생성 및 .env파일 작성 
export OPENAI_API_KEY="personal key"

# 로컬 jupyter build
# docker-compose build
 
# jupyter 실행
docker-compose up -d 

```

## Content
Access all of the jupyter notebooks and python files within the [content](content) folder.
