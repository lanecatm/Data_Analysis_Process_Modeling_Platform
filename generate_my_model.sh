rails generate model Comment title:string body:text score:integer author:references comment_parent:references workflow:references process:references
#rails d model ProcessInformation
#rails d model Author
#rails d model Department
#rails d model Category
#rails d model Tag
#rails d model Algorithm
#rails d model Type
#rails d model Format
#rails d model ColumnInformation
#rails d model Separator
#
#rails generate model ProcessInformation name:string introduction:text author:references last_editor:references createtime:datetime edittime:datetime version:string version_parent:references category:references functional_description:text separator:references 
##rails generate model Comment commenter:string body:text score:integer createtime:datetime process_information:references
#rails generate model User name:string password:string department:references
#rails generate model Department name:string parent:references
#rails generate model Category name:string description:text
##rails generate model Tag name:string description:text
##rails generate model Algorithm name:string description:text
#rails generate model SupportType name:string
#rails generate model InputFormat column_index:integer column_name:string column_type:references process_information:references
#rails generate model OutputFormat column_index:integer column_name:string column_type:references process_information:references
#rails generate model Separator name:string description:text process_information:references
