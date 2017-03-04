#rails generate model ProcessInformation name:string introduction:text author:string createtime:datetime version:string algorithm:string functional_description:text
#rails generate model Comment commenter:string body:text score:integer createtime:datetime process_information:references
rails generate model SearchRequest search_content:string search_type:string

