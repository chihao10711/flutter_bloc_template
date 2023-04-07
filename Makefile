env_prod:
	cat .env.production > .env

re_build_staging:
	script/re_build_staging.sh