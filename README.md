# movie-recommender-db

자세한 분석 결과 : `MOVIEDB_report.pdf`에서 확인 가능합니다.

# Movie Recommendation Database (MySQL)


영화 추천 알고리즘(협업 필터링 / 콘텐츠 기반 / 하이브리드)을 위한 **평점·리뷰 중심 관계형 데이터베이스(MySQL)** 를 설계하고 구축한 프로젝트입니다.

<br>

사용자(User)의 리뷰/평점 데이터를 기반으로 **선호 장르/감독/출연진 분석**이 가능하며,<br> 
추천 모델의 입력 데이터로 바로 활용할 수 있도록 **정규화된 스키마 + 무결성 제약 + 분석 SQL**을 포함합니다.

---

## Goal
- 영화 추천을 위한 핵심 엔티티(사용자/영화/리뷰/배우/출연)를 **정규화(3NF)** 기반으로 설계
- **참조 무결성(FOREIGN KEY)** 및 제약조건으로 데이터 품질 보장
- 샘플 데이터 삽입 후 **분석/인사이트 SQL**로 결과 확인
- 추천 모델에서 바로 사용할 수 있는 형태로 **행렬/피처 추출 쿼리** 제공

---

## ER Diagram
<img width="678" height="494" alt="스크린샷 2026-01-13 19 38 51" src="https://github.com/user-attachments/assets/1035d85a-7686-4922-bc14-3b5fa2d3a748" />

---

## Schema Overview
### Tables
- `user` : 사용자 정보
- `movie` : 영화 메타데이터(장르/감독/러닝타임/개봉년도 등)
- `review` : 사용자 평점/리뷰 (User–Movie 연결 핵심)
- `actor` : 배우 정보
- `casting` : Movie–Actor N:M 관계 연결 테이블

### Relations
- `user (1) -> (N) review`
- `movie (1) -> (N) review`
- `movie (N) <-> (M) actor` (via `casting`)

---

## Analysis Queries

### 1) 장르별 평균 평점
```sql
SELECT m.genre, ROUND(AVG(r.rating), 2) AS avg_rating
FROM movie m
JOIN review r ON m.movie_id = r.movie_id
GROUP BY m.genre
ORDER BY avg_rating DESC;
```

### 2) 감독별 평균 평점 TOP 5 (리뷰 수 최소 조건 포함)
```sql
SELECT m.director, ROUND(AVG(r.rating), 2) AS avg_rating, COUNT(*) AS n_reviews
FROM movie m
JOIN review r ON m.movie_id = r.movie_id
GROUP BY m.director
HAVING COUNT(*) >= 3
ORDER BY avg_rating DESC
LIMIT 5;
```

### 3) 장르별 리뷰 수 (관객 참여도)
```sql
SELECT m.genre, COUNT(r.review_id) AS review_count
FROM movie m
JOIN review r ON m.movie_id = r.movie_id
GROUP BY m.genre
ORDER BY review_count DESC;
```

---

## Recommender System Integration Points

### (A) 협업 필터링용: User-Item Rating Matrix
```sql
SELECT user_id, movie_id, rating
FROM review;
```

### (B) 콘텐츠 기반용: 영화 메타 피처
```sql
SELECT movie_id, genre, director, runtime, release_year
FROM movie;
```

### (C) 하이브리드용: 영화-출연진 피처 확장
```sql
SELECT m.movie_id, m.title, m.genre, m.director, a.actor_name, c.role_name
FROM movie m
JOIN casting c ON m.movie_id = c.movie_id
JOIN actor a ON c.actor_id = a.actor_id;
```

---

## Repository Structure
```text
.
├── MOVIEDB.sql
├── MOVIEDB_report.pdf
├── assets/
│   └── erd.png
└── README.md
```






