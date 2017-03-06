#rails generate model ProcessInformation name:string introduction:text functional_description:text createtime:datetime edittime:datetime version:string version_num:integer
#rails generate model Comment commenter:string body:text score:integer createtime:datetime process_information:references

rails generate model Author name:string password:string
rails generate model Department name:string
rails generate model Category name:string description:text
rails generate model Tag name:string description:text
rails generate model Algorithm name:string description:text
rails generate model Type name:string
rails generate model Format
rails generate model ColumnInformation name:string index:integer
rails generate model Separator name:string description:text
