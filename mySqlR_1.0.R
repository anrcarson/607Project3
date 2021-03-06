library(dbConnect)

username = 'data607'
password = 'project3'
dbname = 'ds_skills'
host = 'data607-project3.ce2dfe0qxt5q.us-west-2.rds.amazonaws.com'
myDb = dbConnect(MySQL(), user=username, password=password, dbname=dbname, host=host)

qryString = 'SELECT jobs.post_id, role_desc, city, state, keyword_desc 
            FROM jobs
            INNER JOIN locations
            ON jobs.loc_id = locations.loc_id
            INNER JOIN roles
            ON jobs.role_id = roles.role_id
            INNER JOIN post_keys
            ON jobs.post_id = post_keys.post_id 
            INNER JOIN  keywords
            ON post_keys.key_id = keywords.key_id
            ;'

selectQry = dbSendQuery(myDb, qryString)
results = fetch(selectQry, n = -1)
results
