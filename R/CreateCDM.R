getSQL <- function(filepath){
	con = file(filepath, "r")
	sql.string <- ""

	while (TRUE){
		line <- readLines(con, n = 1)

		if ( length(line) == 0 ){
			break
		}

		line <- gsub("\\t", " ", line)

		if(grepl("--",line) == TRUE){
			line <- paste(sub("--","/*",line),"*/")
		}

		sql.string <- paste(sql.string, line)

	}

	close(con)
	return(sql.string)
}
CreateCDM= function(connectionDetails){
# get SQL scripts for building CDM
ddl=getSQL(filepath = '/Users/daweizhou/Documents/David_research/ETL-MCHI/SQL/test.sql')

rdbms <- tolower(connectionDetails$dbms)
tableDDL <- SqlRender::translate(sql = ddl, targetDialect = rdbms)
# execute sql query
conn <- DatabaseConnector::connect(connectionDetails)
DatabaseConnector::executeSql(conn, tableDDL)
on.exit(DatabaseConnector::disconnect(conn))

}
