#rails generate model Comment title:string body:text score:integer author:references comment_parent:references workflow:references process:references
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

#rails generate model WorkflowInformation name:string introduction:text detial_description:text version_name:text category:references author:references last_editor:references status:integer createtime:datetime valid_from:datetime valid_to:datetime persistent:boolean priority:integer most_possible_duration:integer minimal_duration:integer maximal_duration:integer
#
#rails generate model WorkflowComment title:string body:text score:integer author:references comment_parent:references workflow_information:references process:references
#
#rails generate model WorkflowPrivilege workflow_information:references edit_department:references execute_department:references delete_department:references
#
#rails generate model ProcessInformation workflow_information:references name:string description:text creater:references user:references is_shared:boolean parent_case:references persistent:boolean state:text case_type:integer
#
#rails generate model SharedProcessPrivilege process:references edit_department:references execute_department:references delete_department:references isSharedSampleInput:boolean
#
#rails generate model DepartmentInformation name:text parent_department:references description:text layer:integer manager:references vice_manager:references duty:text
#
#rails generate model PersonInformation person_name:string user_name:string gender:string birthday:datetime description:text phone_number:string email:string technical_post:string state:integer password:string
#
#rails generate model WorkflowCategory name:string description:text
#
#rails generate model WorkflowTag name:string

#rails generate model WorkflowInformationAndTag workflow_information:references workflow_tag:references


#rails d model UplaodFile
#rails generate model UploadFile name:text path:text process_information:references
#rails generate model TestAlgorithm name:string param1:integer param2:string param3:string process_information:references 
