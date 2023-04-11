# Rails

## Rails

> Ruby on Rails는 Ruby 언어로 작성된 오픈소스로 강력하고 탄탄한 웹 어플리케이션을 빠르게 개발할 수 있게 만들어주는 웹 프레임워크   

### 프레임워크란?

- 정형화 되어있는 뼈대, 구조
- 소프트웨어의 구체적인 부분에 해당하는 설계와 구현을 재사용할 수 있게끔 일련의 협업화된 형태로 클래스를 제공하는 것
- 프로그램의 뼈대가 되는 기반 코드와 설정이 이미 존재하여 그 기반을 토대로 개발자가 원하는 기능을 추가할 수 있는 라이브러리가 통합된
- 프로그램이 정상적으로 동작하기 위해 존재하는 가이드라인

### 특징

1. MVC 아키텍처 구조
2. 관습적이지 않은 면만 정의하면 된다.(CoC)
3. 똑같은 것을 반복하지 않는 구조(DRY)

### MVC 구조

- Model
  - 모델은 비즈니스 로직을 다루고 데이터 및 데이터베이스에 대한 작업을 한다.
- View
  - 뷰는 사용자의 요청에 따른 결과물이 표현되는 부분으로서 화면에 표출되는 방식에 대한 로직과 데이터를 다룬다
- Controller
  - 컨트롤러는 모델과 뷰를 연결시키고 사용자의 입력을 받아 모델을 조작하는 등 데이터 흐름을 제어하는 역할을 한다.

### CoC

- `Convention over Configuration`
- `CoC/Rails`는 최선의 방법으로 일을 처리하게 해주는 디폴트/소프트웨어 디자인 패러다임이다.
- 끊임없는 컴퓨터 구성 파일을 설정하는 일보다 더 많은 시간을 투자할 수 있도록 개발자가 내려야할 수 많은 결정들을 줄여준다.
  - Rails에서 미리 제공하는 규칙을 지키며 개발하면, 개발자는 정말 필요한 개발 작업에만 집중할 수 있음
  - 하지만 구조를 이루는 요소 각각은 저마다 알맞는 역할을 수행하기 위해 준비되기 때문에 파일 구조가 복잡하다는 단점이 있다.

### DRY

- `DRY(Don't Repeat Yourself)`는 코드에 반복성을 줄이기 위한 소프트웨어 이론이다.
  - 더 쉽게 관리하고 확장할 수 있고 버그를 줄일 수 있다.

### Active Record

- `Active Record`란 레일즈에서 제공하는 모듈로, RDBMS의 테이블을 ORM(Object Relational Mapping)해서 SQL에 직접 사용하지 않고 데이터를 조작하게 해준다.
- 레일즈 어플리케이션에서 모델의 기초로 데이터베이스 추상화와 기본 CRUD 기능, 고급 검색 능력과 객체들 간의 관계를 정의하는 기능을 제공한다.

### 구조 설명

#### 1. app/controllers

- `app` 디렉터리의 하위 디렉터리인 `controllers` 안에 생성되는 파일은 Rails의 MVC 패턴에서 `controller`에 해당하는 코드가 담겨있다.

#### 2. app/views

- MVC 패턴에서 view에 해당하는 코드가 들어간다.
- Rails에서는 view는 controller 내부의 action과 일대일 매칭되어 설정된다.

#### 3. app/models

- MVC 패턴에서 model 역할을 수행하는 코드가 들어간다.
- 내부적으로 설정된 데이터베이스와 연동되어서 관련 테이블을 `class`화 시킨 것이 model이라고 생각하면 된다.

#### 4. config/routes.rb

- config 디렉터리에 포함되어 있는 `routes.rb` 파일은 클라이언트에서 요청하는 `URL`을 특정 `controller`의 `action`과 매칭한다.

#### 5. db/migrate

- 사용자가 `model`을 사용하려면 Rails 프로젝트와 연결된 데이터베이스에 실제로 테이블을 생성해야 한다.
- 실제 테이블을 만들기 위한 코드들은 `db` 디렉터리의 하위 디렉터리인 `migrate`에 파일형태로 생성된다.

#### 6. db/schema.rb

- 실제로 데이터베이스에 테이블이 생성되면 Rails 프로젝트의 db 디렉터리 하위에 생성되는 파일

#### 7. Gemfile

- Ruby에서 라이브러리를 `Gem`이라고 부르는데 Gemfile에 작성하여 Rails 프로젝트에 추가할 수 있다.

## 페이지 만들기

### 1. 프로젝트 생성

```bash
rails new rails-project
```

### 2. 컨트롤러 생성

```bash
rails g controller post index new create deit 
```

- `app/controllers/home_controller.rb` 생성

```rb
class ApplicationController < ActionController::Base
  def index
  end
end
```

- index action 추가

### 3. View 생성

```html
<h1>
  Hello rails world!
</h1>
```

- index action과 연결할 view 생성
  - `app/views/home` 디렉터리에서 index action과 동일한 이름을 가진 `index.html.erb` 파일 생성
- `html.erb`
  - 일반 html에 ruby 문법을 사용할 수 있도록 루비를 임베드한 view 디렉터리의 하위 디렉터리는 controller 이름과 동일하게 하고 디렉터리 안에 포함된 파일 이름은 action 이름과 동일하게 맞추면 자동으로 연결된다.

### 4. Route 설정

```rb
Rails.application.routes.draw do
  get "home" => "home#index"
end
```

- `get "home" => "home#index"`로 작성하면 `localhost:3000/home`으로 
들어가면
  - home_controller의 index action이 실행되고, index.html.erb로 응답받는다.
- [HTTP method] "uri" => "controller#action"의 규칙을 따른다.

### 5. `/` root 주소 접근

```rb
Rails.application.routes.draw do
  root "home#index"

  get "home" => "home#index"
end
```

- `localhost:3000`으로 이동하면 home controller의 index action을 보내라는 의미이다.

## 페이지 이동하기

### `app/controllers/home_controller.rb`

```rb
class ApplicationController < ActionController::Base
  def index
  end

  def next
  end
end
```

### `app/config/routes.rb`

```rb
Rails.application.routes.draw do
  root "home#index"

  get "home/index" => "home#index"
  get "home/next" => "home#next"
end
```

### `app/views/home/next.html.erb`

```html
<h1>Home#index<h1>
<p>Find me in app/views/index/index.html.erb</p>

<a href="/home/index">home/index로 이동</a>
```

### `app/views/home/index.html.erb`

```html
<h1>Home#next<h1>
<p>Find me in app/views/home/index.html.erb</p>

<a href="/home/next">home/next 이동</a>
```

## Scaffold

> https://velog.io/@y_dragonrise/Rails-Scaffold     
> 뼈대, 기반이라는 뜻을 가지고 있으며, 이 뜻에 걸맞게 기본 기능들을 갖춘 프로젝트의 뼈대를 만들어 준다.   
> 기존에 작성했던 CRUD 코드보다 더 다양한 기능을 사용할 수 있는 코드를 완성할 수 있다.

### scaffold 실행

```bash
rails g(enerate) scaffold (테이블명) (컬럼명들)
rails g scaffold SponsorshipSale creater_id:integer closer_id:integer date:date closed_date:date warehouse_code:string
rake db:migrate
```

- `scaffold`는 모델을 생성하는 명령어와 다르게 CRUD 기능을 하는 view와 controller, routes도 자동 생성하는 점에서 차이가 있다.
  - 만약 모델만 생성하는 것이라면 `scaffold`에서 `model`로 수정

```rb
# config/routes.rb
Rails.application.routes.draw do
  resources :sponsorship_sales
end
```

### scaffold 자동 생성

- `rails g(enerate) scaffold (테이블명) (컬럼명들)` 명령어를 실행하면 해당하는 파일을 자동 생성해주며 명령어 하나로
  - `active_record`, `경로`, `controller`, `뷰파일`, `helper`, `jbuilder`, `assets` 등이 자동으로 생성된다.
- `active_record`
  - scaffold로 인해 생성한 SponsorshipSales 모델 관한 부분
- `resource_route`
  - `/config/routes.rb` 파일에 추가된 경로
- `scaffold_controller`
  - scaffold controller 파일
- `erb`
  - 생성된 뷰 파일들
- `jbuilder`
  - html 형태가 아닌 json 형태로 출력하기 위한 부분
- `assets`
  - scaffold에 필요한 scss나 script 요소들

## Migration

> https://velog.io/@khy226/Rails-%EB%A7%88%EC%9D%B4%EA%B7%B8%EB%A0%88%EC%9D%B4%EC%85%98-%EC%95%8C%EC%95%84%EB%B3%B4%EA%B8%B0     
> 마이크레이션은 액티브 레코드의 기능으로, 데이터베이스 스키마(구조)를 변경하는 수단이다.   
> 순수 SQL로 스키마 수정사항을 쓰는 대신, 마이그레이션을 통해 Ruby DSL을 사용하여 테이블에 대한 변경 사항을 작성할 수 있다.     
>   
> 데이터베이스에서 원하는 컬럼을 수정하거나 삭제, 혹은 테이블을 생성할 때 migration 파일을 만들어 원하는 수정사항을 작성하고 `rake:migrate` 명령어를 치면, 마이그레이션이 실행된다. 마이그레이션은 `db/migrate` 디렉터리 내에 파일(`.rb`)로 생성된다.   
>    
> 각각의 migration 파일은 데이터베이스의 새로운 '버전'과 같다. 마이그레이션 파일을 생성하면 파일 생성 시간(UTC 타임스탬프)이 생기는데, 이 숫자는 마이그레이션 버전 넘버이다. 마이그레이션 파일명은 'YYYYMMDDHHMMSS_create_items.rb'과 같은 형식으로 생성된다.

### change 메서드

```rb
class CreateSponsorshipSales < ActiveRecord::Migration[6.1]
  def change
    create_table :sponsorship_sales do |t|
      t.date :date, null: false
      t.string :warehouse_gubun_code, null: false
      t.string :sponsorship_receiver, null: false
      t.references :creater, references: :users, foreign_key: { to_table: :users }
      # ...
      # ...

      t.timestamps
    end
  end
end

```

마이그레이션 파일을 생성해 기존 테이블에 컬럼을 추가할 수도 있다. 해당 파일에 원하는 definition을 추가해서 컬럼을 추가하거나 변경, 삭제할 수 있다.

#### Migration 컬럼 타입

- string
- text
- integer
- float
- decimal
- boolean
- binary
- date
- datetime
- primary_key
- time
- timestamp

#### Migration 'change' 메서드 definition 정리

- `change` 메서드는 마이그레이션에서 가장 자주 사용되는 메서드이다. change 메서드를 사용하면, rollback시 ActiveRecord가 자동으로 이전 버전으로 돌릴 수 있도록 해주며, 많은 작업을 할 수 있다.

```rb
# 컬럼 추가
add_column :table_name, :column_name, :column_type, :column_options

# 외래키 추가
# table1 테이블에 table2_id라는 외래키 추가
add_foreign_key :table_name_1, :table_name_2

# 참조 추가
# table에 ref_id 라는 컬럼이 생성됨.
# options: polymorphic일 때 options에 polymorphic: true줄 수 있음. foreign_key: true, index; true로 외래키나 인덱스 추가 가능
add_reference :table_name, :ref_name, options={}

# 컬럼 옵션 또는 타입 변경
change_column :table_name, :column_name, :column_type, :column_options

# 테이블 생성
create_table :table_name do |t|
  t.column_type :column_name

  t.timestamps
end

# 테이블 drop
drop_table :table_name

# 컬럼 제거
remove_column :table_name, :column_name, :column_type

# index 제거
remove_index :table_name, name: :index_name

# 컬럼 이름 변경
rename_column :table_name, :old_column_name, :new_column_nmae

# 테이블 이름 변경
rename_table ("old_table_name", "new_table_name")
```

#### change 대신 up과 down 메서드로 마이그레이션 작성

```rb
class CreateSponsorshipSales < ActiveRecord::Migration[6.1]
  def up
    change_table :products do |t|
      t.change :price, :string
    end
  end

  def down
    change_table :products do |t|
      t.change :price, :integer
    end
  end
end
```

- up, down 메서드는 앞서 설명한 `change` 메서드와 달리 `rollback`을 해도 `ActiveRecord`가 자동으로 이전 버전으로 되돌리지 못한다.
  - 하지만 위처럼 두 메서드를 동시에 사용하면 `change`와 같은 효과를 낸다.
- `rails db:migrate`를 실행하면 ActiveRecord는 `up` 메서드와 `change` 메서드를 읽는다.
  - `down` 메서드는 읽지 않는다.
- 반대로, `rails db:rollback`을 실행하면 ActiveRecord는 `down` 메서드와 `change` 메서드를 읽는다.
  - `up` 메서드는 읽지 않는다.

### Migrate 실행

#### 1. Migrate

- 특정 버전만 실행시키고 싶은 경우
  ```bash
  rails db:migrate VERSION=202301010202044
  ```
- 이 때, `db:migrate` 커맨드는 `db:schema:dump` 커맨드를 호출하여 `db:schema.rb` 파일을 가장 최신의 데이터베이스 구조와 맞춘다.

#### 2. Rollback

```bash
rails db:rollback STEP=3
```

가장 마지막 마이그레이션을 취소하는 작업이다. `rails db:rollback` 명령어를 실행하면 된다.
