require 'sinatra'
require 'sinatra/reloader'
require "csv"


get '/' do
    erb :index
end

# get '/board/:id' do
#     @id = params[:id]
#     erb :board
# end    

get '/boards' do
    # 파일을 열고 각 줄마다 순회하면서 @가 붙어 있는 변수에 넣는다.
    @boards = []
    CSV.open('./boards.csv','r+').each do |row|
        @boards << row
    end    
    erb :boards
end 

get '/new' do  
    erb :new 
end

post '/create' do
    #사용자가 입력한 정보를 받아서 csv차일 가장 마지막에 등록 
    # -> 그런호도 같이 저장해야함
    # 기존의 글 개수를 파악해서 글 개수 + 1해서 저장한다.
    title = params[:title]
    puts title
    contents = params[:contents]
    puts contents
    id = CSV.read('./boards.csv').count + 1
    puts id
    CSV.open('./boards.csv','a+') do |row|
        row << [id,title,contents]
    end    
    redirect '/boards'
end    

get '/board/:id' do
    # CSV 파일에서 params[:id]로 넘어온 친구와 같은 글번호를 가진 row를 선택
    # -> CSV 파일을 전체 순회한다.
    # -> 순회하다가 첫번째 coulmn이 id와 같은 값을 만나면 순회를 정지하고 값을 변수에다가 담아준다.
    @board = []
    CSV.read('./boards.csv').each do |row|
        # break if row[0] == params[:id] 동일
        if row[0].eql?params[:id]
            @board = row
            break
        end    
    end
    erb :board
end


### 미니 과제

get '/user/new' do
    erb :new_user
end

post '/users/create' do
    id = params[:id]
    password = params[:password]
    password_confirmation = params[:password_confirmation]
    puts id+password+password_confirmation
    
    if password.eql?(password_confirmation)
        #puts 'if문 진입'
        users = []
        CSV.read('./user.csv').each do |row| # 한번 돌려서 모든 아이디를 받아오고
            puts '읽기'
            users << row[0]
        end    
        if users.include? params[:id] #받아온 아이디 중에서 만들려고 하는 아이디가 있다면 error로 가라
            puts '이미 존재하는 '
            @msg = "이미 존재하는 회원입니다."
            erb :error
        else 
        
            puts "입력할 대상"
            CSV.open('./user.csv','a+') do |row|
                puts '입력중'
                row << [id,password]
                redirect "/user/#{id}"
            end    
        end
    else
        puts "오류"
        @msg = "비밀번호가 일치하지 않습니다."
        erb :error
    end
end    

get '/users' do
    @users = []
    CSV.open('./user.csv','r+').each do |row|
        @users << row # 값이 여러 개 있을 때는 <<
    end
    erb :users
end


get '/user/:id' do
    @user =[]
    CSV.read('./user.csv').each do |row|
        if row[0].eql?(params[:id])
            @user = row
            break
        end  
    end    
    erb :user
end
