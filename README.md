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
rails g controller home index
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

## Active Record Association

### Active Record

- `Active Record`는 MVC 패턴 중, M에 해당되는 Rails에서 제공되는 모듈이다.
- 주로 데이터베이스 로직을 제어하는데 사용한다.

### 고객모델과 주문모델(관계를 선언해주지 않는 경우)

```rb
class Customer < ActiveRecord::Base
end

class Order <ActiveRecord::Base
end
```

관계를 사용하지 않는 경우 이 모델들의 선언은 위 코드와 같다.    
그리고 아래 코드처럼 직접 `:customer_id => @customer.id`라는 조건을 추가하여 조회하거나, 삭제해야하는 것을 확인할 수 있다.

#### 새로운 주문 추가

```rb
@order = Order.create(:order_date => Time.now, :customer_id => @customer.id)
```

#### 고객 삭제 및 관련 모든 주문 삭제

```rb
@orders = Order.where(:customer_id => @customer.id)
@orders.each do |order|
  order.destory
end
@customer.destory
```

### 고객모델과 주문모델(관계를 선언하는 경우)

```rb
class Customer < ActiveRecord::Base
  has_many :orders, :dependent => :destory
end

class Order < ActiveRecord::Base
  belongs_to :customer
end
```

- 고객과 주문 모델 사시에 관계가 있음을 선언해 줌으로써 일괄처리가 가능하다.    
- 이렇게 활성 레코드 관계(ActiveRecord Association)을 이용한다면 관계를 선언하지 않은 경우보다 코드 작성하는 것이 쉬워진다.
- `:dependent => :destory`로 설정하면 Customer 모델의 한 고객을 삭제할 때 Order 모델의 해당 고객과 관련된 정보에 대해서도 `destory` 메서드를 호출하여 삭제한다.
  - `:delete`으로 설정하면 `destory` 메서드 호출하지 않고 `delete`한다
- `destory`와 `delete` 차이
  - 

#### 새로운 주문 추가

```rb
@order = @customer.orders.create(:order_date => Time.now)
```

#### 고객 삭제와 관련 모든 주문 삭제

```rb
@customer.destory
```

### 관계의 유형들

- belongs_to
- has_one
- has_many
- has_many :through
- has_one :through
- has_and_belongs_to_many

레일즈는 위 여섯 가지의 관계형을 지원한다.

#### belongs_to

![image](https://user-images.githubusercontent.com/126429401/232645991-a9ee28b9-ce76-4eb7-920f-fa56a5e937c9.png)

- Order 모델은 Customer 모델에 속하게 된다.    
- 이 때 하나의 주문이 오직 하나의 고객에만 관련되어 있다면 위와 같은 관계를 선언해야 한다.

#### has_one

![image](https://user-images.githubusercontent.com/126429401/232646198-4870f0bf-0b04-4711-acea-d0217b313581.png)

- 이 관계는 하나의 모델(Supplier)가 다른 모델(Account)을 소유하거나 포함하는 것을 의미한다.
- 예를 들어, 공급업체마다 하나의 계정을 가지고 있다면, 위와 같은 관계를 선언할 것이다.

#### has_many

![image](https://user-images.githubusercontent.com/126429401/232647816-2c9e124a-ab80-4233-9d00-3924ff48f6d7.png)

- 이 관계는 belongs_to 관계의 반대이다.
- 이 관계는 다른 모델(Order)을 하나도 가지고 있지 않거나 여러 개 가지고 있을 때 사용할 수 있다.
- **주의: `has_many B` 관계를 선언하는 경우에 `orders`와 같이 복수형의 이름을 갖게 되는 것을 주목해야 한다.**

#### has_many : through

![image](https://user-images.githubusercontent.com/126429401/232648281-d8f0218e-6633-49a6-9a47-5a89adc75bd8.png)

- `has_many : through` 관계는 다른 모델과의 **다대다 관게**를 설정할 때 사용된다.
- 이 관계는 다른 복수개의 모델을 제3의 모델(Appointment)를 통해서 가지게 됨을 말한다.
- 다른 예시 만들기
  ```
  학생(students)      수강(enrollments)      과목(courses)
  ---------           ---------             ---------
  id                   id                   id
  학번                 학생_id               과목코드
  이름                 과목_id               과목명
  연락처               평점                   ...
  ...
  ```
  ```rb
  class Student < ActiveRecord::Base
    has_many :enrollments
    has_many :courses, :through => enrollments
  end

  class Enrollment < ActiveRecord::Base
    belongs_to :student
    belongs_to :course
  end

  class Course < ActiveRecord::Base
    has_many :enrollments
    has_many :students, through => enrollments
  end
  ```

### has_one :through

![image](https://user-images.githubusercontent.com/126429401/232651831-96e35c18-4027-4d8e-b1b5-4f263516bacd.png)

```rb
class Supplier < ActiveRecord::Base
  has_one :account
  has_one :account_history, :through => :account
end

class Account < ActiveRecord::Base
  belongs_to :supplier
  has_one :account_history
end

class AccountHistory < ActiveRecord::Base
  belongs_to :account
end
```

- `has_one :through` 관계는 또다른 모델과의 1:1 연관을 설정할 때 사용한다.
- 공급업체가 하나의 계정을 갖고, 각 계정은 계정내역을 가지고 있을 때 위와 같은 모델 관계를 설정할 수 있다.

### has_and_belongs_to_many

![image](https://user-images.githubusercontent.com/126429401/232669364-3ce0c65a-1750-4ba5-97bb-671a01b1ebf3.png)

```rb
class Assembly < ActiveRecord::Base
  has_and_belongs_to_many :parts
end

class Part < ActiveRecord::Base
  has_and_belongs_to_many :assemblies
end
```

- `has_and_belongs_to_many` 관계는 다른 모델과 **다대다 관계** 사이에 그 어떤 모델도 없이 직접 생성한다.
- 조립품은 많은 부품을 가지고, 한 부품은 여러 조립에 사용된다면, 위와같은 모델 관계를 설정할 수 있다.

## Active Record Callbacks

### trigger callbacks

- create(attributes = nil, &block)
  ```rb
  # 새로운 단일 객체 생성
  User.create(first_name: 'Jamie')

  # 배열 형태의 복수 객체 생성
  User.create([{ first_name: 'Jamie' }, { first_name: 'Jeremy' }])

  # 새로운 단일 객체 생성 및 블록에 다른 속성 설정
  User.create(first_name: 'Jamie') do |u|
    u.is_admin = false
  end

  # 배열 형태의 복수 객체 생성 및 블록에 다른 속성 설정
  User.create([{ first_name: 'Jamie' }, { first_name: 'Jeremy' }]) do |u|
    u.is_admin = false
  end
  ```
  - 유효성 검사를 통과할경우 객체(또는 여러 객체)를 생성하여 데이터베이스에 저장한다.
  - 결과 객체가 데이터베이스에 성공적으로 저장되었는지 여부에 관계없이 결과 객체가 반환된다.
  - 매개변수는 해시 또는 해시 배열일 수 있다.
    - 이렇나 해시는 생성할 객체의 특성을 정한다.
- create!
- destroy(id)
  ```rb
  # DELETE FROM todos WHERE id = 1
  Todo.destroy(1)

  # DELETE FROM todos WHERE id in (1, 2, 3)
  Todo.destroy([1, 2, 3])
  ```
  - id는 Integer나 Array of Integers의 형태로 받을 수 있다.
  - 지정된 id 객체를 찾아서 해당 객체 삭제(SELECT -> DELETE)
    - 만약 찾을 수 없는 경우 `ActiveRecord::RecordNotFound` 에러 발생
  - delete 메서드는 바로 DELETE 실행
- destroy!
- destroy_all
  - 각 레코드를 인스턴스화하고 destroy 메서드를 호출하여 조건과 일치하는 레코드를 삭제
  - 한 번에 많은 레코드를 제거하는 경우 각 레코드의 인스턴스화, 콜백 실행 및 삭제에 많은 시간이 소요될 수 있다.
  - 연결이나 콜백에 관계없이 많은 행을 빠르게 삭제하려면 대신 `delete_all`을 사용한다.
  ```rb
  Person.destroy_all("last_login < '2023-04-23'")
  Person.destory_all(:status => "inactive")
  Person.where(:age => 0..18).destroy_all
  ```
- destroy_by(*args)
  - 지정된 조건과 일치하는 모든 레코드를 찾아 삭제한다.
  - 삭제된 객체의 컬렉션을 반환한다.
  - 레코드를 찾을 수 없다면, 빈 배열을 반환한다.
  ```rb
  Person.destroy_by(id: 13)
  Person.destroy_by(name: 'Spartacus', rating: 4)
  Person.destroy_by("published_at < ?", 2.weeks.ago)
  ```
- save
  - 모델을 저장한다. 만약 모델이 새 것이면 레코드가 데이터베이스에 생성되고, 그렇지 않으면 기존 레코드가 업데이트된다.
  - 기본적으로 저장할 때 유효성 검사를 실행한다.
    - 만약 하나라도 실패하면 작업이 취소되고 저장이 false를 반환하며 레코드는 저장되지 않는다.
    - 하지만 `validate: false`를 제공하면 유효성 검사가 모두 패스되기 때문에 가급적 사용하지 않는 것이 좋다.
  - `update_at`도 현재 시간으로 설정하지만 `touch: false` 옵션을 설정하여 제공하면 timestamp는 업데이트되지 않는다.
- save!
- save(validate: false)
- toggle(attribute)
  - 현재 boolean 속성의 반대 속성을 할당한다.
    - true -> false, false -> true
  - 이 메서드는 설정자를 호출하지 않고 기본값을 직접 전환하고, 자신을 반환한다.
  ```rb
  user = User.first
  user.banned? # false
  user.toggle(:banned)
  user.banned? # true
  ```
- toggle!
- touch(*names, time:nil)
  ```rb
  product.touch # updated_at을 현재 시간으로 업데이트
  product.touch(time: Time.new(2023, 4, 20, 0, 0, 0)) # udpated_at을 특정 시간으로 업데이트
  product.touch(:designed_at) # designed_at과 updated_at 업데이트
  product.touch(:started_at, :end_at) # started_at, end_at, updated_at 업데이트
  ```
  - updated_at 특성을 현재 시간 또는 지정된 시간으로 설정된 레코드로 저장할 수 있다.
  - 이 메서드는 속성 이름과 옵션인 시간 인수를 전달할 수 있다.
  - 특성 이름이 전달되면 updated_at 속성과 함께 업데이트된다.
  - 시간 인수를 전달하지 않으면 현재 시간을 기본값으로 사용한다.
- update_attribute(name, value)
  - 단일 특성을 업데이트하고 레코드를 저장한다.
  - 하지만 유효성 검사를 건너뛴다.
- update(id = :all, attributes)
  ```rb
  # 단일 레코드 업데이트
  Person.update(15, user_name: "Samuel", group: "expert")

  # 복수 레코드 업데이트
  people = { 1 => { "first_name" => "David" }, 2 => { "first_name" => "Jeremy" }}
  Person.update(people.keys, people.values)

  # Relation 결과로부터 복수 레코드 업데이트
  people = Person.where(group: "expert")
  people.update(group: "masters") 
  ```
- update!

### after_find callbacks

- all
  - 모든 레코드를 반환한다.
- first(limit = nil)
  ```rb
  class Person < ActiveRecord::Base
    has_many :pets
  end

  person.pets
  # => [
  #       #<Pet id: 1, name: "Fancy-Fancy", person_id: 1>,
  #       #<Pet id: 2, name: "Spook", person_id: 1>,
  #       #<Pet id: 3, name: "Choo-Choo", person_id: 1>
  #    ]

  person.pets.first # => #<Pet id: 1, name: "Fancy-Fancy", person_id: 1>

  person.pets.first(2)
  # => [
  #      #<Pet id: 1, name: "Fancy-Fancy", person_id: 1>,
  #      #<Pet id: 2, name: "Spook", person_id: 1>
  #    ]
  ```
  - 첫 번째 레코드 또는 첫 번째에서 n개의 레코드를 반환한다.
- find(*args)
    ```rb
  class Person < ActiveRecord::Base
    has_many :pets
  end

  person.pets
  # => [
  #       #<Pet id: 1, name: "Fancy-Fancy", person_id: 1>,
  #       #<Pet id: 2, name: "Spook", person_id: 1>,
  #       #<Pet id: 3, name: "Choo-Choo", person_id: 1>
  #    ]

  person.pets.find(1) #  #<Pet id: 1, name: "Fancy-Fancy", person_id: 1>
  person.pets.find(4) # ActiveRecord::RecordNotFound: Couldn't find Pet with 'id'=4

  person.pets.find(2) { |pet| pet.name.downcase! }
  # #<Pet id: 2, name: "fancy-fancy", person_id: 1>

  person.pets.find(2, 3)
  #  [
  #     #<Pet id: 2, name: "Spook", person_id: 1>,
  #     #<Pet id: 3, name: "Choo-Choo", person_id: 1>
  #   ]
  ```
  - id에 맞는 객체를 찾는다.
  - 객체를 찾을 수 없는 경우 RecordNotFound 에러 발생한다.
- find_by
  ```rb
  Post.find_by(name: 'Spartacus', rating: 4)
  Post.find_by("published_at < ?", 2.weeks.ago)
  ```
  - 지정된 조건에 맞는 첫 번째 레코드를 반환한다.
  - 레코드를 찾을 수 없는 경우 `nil`을 반환한다.
- count_by_sql
  ```rb
  # 12
  Product.count_by_sql "SELECT COUNT(*) FROM sales s, customers c WHERE s.customer_id = c.id"
  ```
  - SELECT 부분에 COUNT(*)만 포함해야 하는 SQL 문의 결과를 반환한다.
  - `ActiveRecord::Calculations`의 클래스 메서드를 사용한다.
- find_by_sql
  ```rb
  Post.find_by_sql "SELECT p.title, c.author FROM posts p, comments c WHERE p.id = c.post_id"
  # [#<Post:0x36bff9c @attributes={"title"=>"Ruby Meetup", "author"=>"Quentin"}>, ...]

  Post.find_by_sql ["SELECT title FROM posts WHERE author = ? AND created > ?", author_id, start_date]
  Post.find_by_sql ["SELECT body FROM comments WHERE author = :user_id OR approved_by = :user_id", { :user_id => user_id }]
  ```
  - 데이터베이스에 대해 사용자 지정 SQL을 실행하고 모든 결과를 반환한다.
  - 결과는 배열로 반환되고 해당 모델의 객체가 요소로 저장된다.
- last
  ```rb
  class Person < ActiveRecord::Base
    has_many :pets
  end

  person.pets
  # => [
  #       #<Pet id: 1, name: "Fancy-Fancy", person_id: 1>,
  #       #<Pet id: 2, name: "Spook", person_id: 1>,
  #       #<Pet id: 3, name: "Choo-Choo", person_id: 1>
  #    ]

  person.pets.last # => #<Pet id: 3, name: "Choo-Choo", person_id: 1>

  person.pets.last(2)
  # => [
  #      #<Pet id: 2, name: "Spook", person_id: 1>,
  #      #<Pet id: 3, name: "Choo-Choo", person_id: 1>
  #    ]
  ```
  - 마지막 레코드 또는 마지막에서 `n`개의 레코드를 반환한다.


### 주의해야할 callback

- delete
  - destroy와는 다르게 SELECT 조회하지 않고 바로 DELETE
  - 별도 에러가 발생하지 않고 만약 해당 객체가 삭제되면 1을 삭제되지 않으면 0을 반환
- delete_all
- delete_by
  ```rb
  Person.delete_by(id: 13)
  Person.delete_by(name: 'Spartacus', rating: 4)
  Person.delete_by("published_at < ?", 2.weeks.ago)
  ```
  - 지정한 조건에 맞는 모든 레코드들을 찾아 삭제한다.
  - 삭제된 레코드의 수를 반환한다.
- insert
- insert!
- insert_all
  ```rb
  Book.insert_all([
    { id: 1, title: "Rework", author: "David" },
    { id: 1, title: "Eloquent Ruby", author: "Russ" } # id가 중복되기 때문에 "Eloquent Ruby"는 생략된다.
  ])
  ```
  - SQL `INSERT` 문에서 복수 레코드를 삽입할 수 있다.
- insert_all!
- update_column
- update_columns
- update_all
- upate_counters
- upsert
  - 단일 SQL INSERT 문에서 단일 레코드를 데이터베이스에 업데이트하거나 삽입한다
  - 모델을 따로 인스턴스화하거나 유효성 검사를 트리거하지 않는다.
- upsert_all

## ActiveRecord Query Interface

```rb
class Client < ActiveRecord::Base
  has_one :address # Address 모델에 client_id
  has_many :orders # Order 모델에 client_id
  has_and_belongs_to_many :roles # Role 모델과 직접적인 다대다 관계
end

class Address < ActiveRecord::Base
  belongs_to :client # Client 모델에 속함
end

class Order < ActiveRecord::Base
  belongs_to :client, :counter_cache => true # Client 모델에 속함
end

class Role < ActiveRecord::Base
  has_and_belongs_to_many :clients # Client 모델과 직접적인 다대다 관계
end
```

ActiveRecord는 데이터베이스 상에서 쿼리를 실행하여 대부분의 데이터 베이스(MySQL, PostgreSQL, SQLite 등)와 호환된다. ActiveRecord의 장점 중 하나로, 사용하는 데이터베이스가 달라도, 액티브 레코드 메서드 사용 방식은 **항상 동일**하다.

### 데이터베이스에서 객체 조회

- 데이터베이스에서 객체를 조회하기 위해, 액테브 레코드는 몇가지 메서드를 제공한다.
  - 각 메서드는 기본 SQL을 사용하지 않고, 데이터베이스에 정확한 쿼리를 수행하기 위해서 인자를 받는다.
- where
- select
- group
- order
- limit
- offset
- joins
- includes
- lock
- readonly
- from
- having

### 단일 객체 검색

```rb
# 기본키(id) 10을 가지고 client 찾기
client = Client.find(10) # SELECT * FROM clients WHERE (clients.id = 10)
# <Client id: 10, first_name: => "Ryan">

# 만약 일치하는 레코드가 없다면, Model.first는 nil을 반환
client = Client.first # SELECT * FROM clients LIMIT 1

# Modal.last도 일치하는 레코드가 없다면 nil을 반환
client = Client.last # SELECT * FROM clieitns ORDER BY clents.id DESC LIMIT 1
```

### 복수 객체 검색

```rb
# 기본키 1과 0에 해당하는 client 객체 찾기
client = Client.find(1, 10) # Or even Client.find([1, 10])
# => [#<Client id: 1, first_name: => "Lifo">, #<Client id: 10, first_name: => "Ryan">]
# SELECT * FROM clients WHERE (clients.id IN (1, 10))
```

## 조건

### 순수 문자열 조건

```rb
Client.where("orders_count = '2'")
Client.where("first_name LIKE '%#{params[:first_name]}%'")
```

- 순수한 문자열로 조건을 작성하면 SQL injection exploits(SQL 삽입 취약점 공격)에 취약할 수 있다.
  
### Array 조건

```rb
Client.where("orders_count = ?", params[:orders])

Client.where("orders_count = ? AND locked = ?", params[:orders], false)
```

- 첫 번째 물음표는 `params[:orders]`의 값으로 대체되고, 두 번째 물음표는 false의 SQL 표현으로대체된다.

#### 인수 안전

```rb
Client.where("orders_count = ?", params[:orders])

Client.where("order_count = #{params[:orders]}")
```

- 아래처럼 작성하면 **변수를 조건에 문자열에 직접 넣으면 변수가 있는 그대로 데이터베이스에 전달**된다.
- 악의적인 의도를 가진 사용자가 데이터베이스를 악용할 수 있는 위험에 처할 수있다.

#### 자리 표시자 조건

```rb
Client.where("created_at >= :start_date AND created_at <= :end_date",
  {:start_date => params[:start_date], :end_date => params[:end_date]})
```

- 배열 조건에서 키/값 해시를 지정할 수 있다.

#### 범위 조건

```rb
# SELECT "clients".* FROM "clients" WHERE ("clients"."created_at" BETWEEN '2010-09-29' AND '2010-11-30')
Client.where(:created_at => (params[:start_date].to_date)..(params[:end_date].to_date))
```

- 특정 기간에 생성된 사용자를 찾는 경우 컨트롤러로부터 두 개의 날짜가 있으면 다음과 같이 범위를 통해 조회할 수 있다.

### 해시 조건

조건 구문의 가독성을 높일 수 있도록 해시 조건을 전달할 수 있다.

#### 평등 조건

```rb
Client.where(:locked => true)

Client.where('locked' => true)
```

- 필드 이름은 문자열일 수 있다.

#### 범위 조건

```rb
# SELECT * FROM clients WHERE (clients.created_at BETWEEN '2008-12-21 00:00:00' AND '2008-12-22 00:00:00')
Client.where(:created_at => (Time.now.midnight - 1.day)..Time.now.midnight)
```

- 쿼리를 작성하지 않고 필드에 대한 범위를 전달할 수 있다.

#### 하위 집합 조건

```rb
# SELECT * FROM clients WHERE (clients.orders_count IN (1,3,5))
Client.where(:orders_count => [1, 3, 5])
```

- `IN` 표현식을 사용하여 레코드를 찾으려면 조건 해시에 배열을 전달할 수 있다.

### Ordering

```rb
Client.order("create DESC, orders_count ASC")
```

### 특정 필드 선택

```rb
# SELECT viewable_by, locked FROM clients
Client.select("viewable_by, locked")
Client.select("DISTINCT(name)")

Client.select(:viewable_by, :locked)
Client.select(:name).distinct # SELECT DISTINCT name FROM Client
```

- DISTINCT 함수를 사용하여 특정 필드의 고유값당 단일 레코드만 가져오려는 경우에 사용할 수 있다.

### 제한 및 오프셋

```rb
# SELECT * FROM clients LIMIT 5 OFFSET 30
# SELECT * FROM clients LIMIT 5, 30
Client.limit(5).offset(30)
```

- 최대 5개의 30개 넘김
- LIMIT 숫자: 출력할행의 수
- OFFSET 숫자: 몇 번째 row부터 출력할 지 (1번째 row면 0)

### Group

```rb
# SELECT DATE(created_at) FROM orders GROUP BY DATE(created_at) ORDER BY created_at
Order.select("date(created_at)").group("date(created_at)").order("created_at")
```

### Having

```rb
# SELECT DATE(created_at) FROM orders GROUP BY DATE(created_at) HAVING (DATE(created_at) > '2023-03-20 13;46:07.242412')
Order.select("date(created_at)").group("date(created_at)").having("date(created_at) > ?", 1.month.ago)
```

```rb
# SELECT DATE(created_at), sum(cost_amount) AS total_price FROM "orders" GROUP BY DATE(created_at) HAVING (sum(cost_amount) > 50000);
Order.select("DATE(created_at), sum(cost_amount) AS total_price").group("DATE(created_at)").having("sum(cost_amount) > 50000")
```

### Joining Tables

```rb
# SELECT "sponsorship_sales".* FROM "sponsorship_sales" INNER JOIN "sponsorship_sale_details" ON "sponsorship_sale_details"."sponsorship_sale_id" = "sponsorship_sales"."id"
Sp.joins(:sp_details)
```