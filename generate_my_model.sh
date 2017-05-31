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
#rails generate model DownloadFile name:text path:text process_information:references
#rails generate model ProcessResult body:text process_information:references
#rails generate model UserPicture name:text path:text user:references
#rails generate model ProcessFile name:text path:text process_information:references node:integer

#rails generate model NodeType name:text
#rails generate model NodeCategory name:text node_type:references
#rails generate model NodeFunction name:text description:text node_type:references node_category:references 
#rails generate model NodeOptionType name:text
#rails d model NodeOption
#rails d model NodeOptionChoices
#rails generate model NodeOption node_function:references node_index:integer name:text label:text description:text default_value:text node_option_type:references 
#rails generate model NodeOptionChoice node_option:references name:text value:text

#rails generate model Separator name:text value:text
#rails generate model ArffType name:text description:text
#rails generate model TaskCategory name:text
#rails generate model TaskCategoryAndWiki task_category:references wiki_page_path:text
#rails g model WikiAndWorkflowInformation wiki_page:references workflow_information:references
#rails generate model EdgeAttribute name:text
#rails g model TaskPerformance name:text description:text wiki_page:references

#rails generate model NodeInformation name:text node_function:references workflow_information:references
#rails generate model NodeOptionValue node_option:references value:string node_information:references
rails generate model WikiRelationship wiki_page:references related_wiki_page:references
