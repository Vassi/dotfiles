# Template for dotnet core projects
# The below is for configuring things like remove if you need to remove a coverage folder for instance
# used: ${RM} coverage
ifeq ($(OS),WINDOWS_NT)
	SHELL = cmd
	RM = del /f /q
	RRM = rmdir /q /s
	CMDQUIET = >nul 2>nul & verify >nul
else
	RM = rm -f
	RRM = rm -rf
	CMDQUIET = >/dev/null/ 2>&1
endif

db-update:
	dotnet ef database update -p REPLACE_WTH_DB_PROJECT -s REPLACE_WTH_API_CONFIG_PROJECT
migration:
	dotnet ef migrations add ${NAME} -p REPLACE_WTH_DB_PROJECT -s REPLACE_WTH_API_CONFIG_PROJECT
migration-remove:
	dotnet ef migrations remove -p REPLACE_WTH_DB_PROJECT -s REPLACE_WTH_API_CONFIG_PROJECT
run:
	dotnet run -p REPLACE_WTH_API__PROJECT
run-watch:
	dotnet watch --project REPLACE_WTH_API__PROJECT run